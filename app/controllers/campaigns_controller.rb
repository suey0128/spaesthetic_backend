class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  # GET /campaigns
  def index
    @campaigns = Campaign.all.select{|c| c[:application_deadline] > Date.today}.sort_by{|c| c[:created_at]}.reverse

    if params[:search]
      @campaigns = @campaigns.select { |c|
        "#{c.name}_#{c.location_name}_#{c.location_type}_#{c.address}_#{c.city}_#{c.state}_#{c.description}".downcase.gsub(" ", "_").include?(params[:search])
      }
    end


    if params[:sort]

      if params[:sort] == "created_at" || params[:sort] == "compensation_market_value"
        @campaigns = @campaigns.select{|cc| cc[params[:sort]] != nil }
        @campaigns = @campaigns.sort_by{|c| c[params[:sort]]}.reverse
      else
        @campaigns = @campaigns.select{|cc| cc[params[:sort]] != nil }
        @campaigns = @campaigns.sort_by{|c| c[params[:sort]]}
      end
    end


      if params[:compensation]
        @campaigns = @campaigns.select{|c| c[:compensation_type].downcase == params[:compensation]}
      end

      if params[:qualification]
        cc = ContentCreator.find(params[:qualification])
        #filter with requirement FOLLOWER NUMBER
        #when the campaigns didn't input the requirement
        no_follower_requirement_campaigns = @campaigns.select{|c| c[:require_following_minimum].class == NilClass || c[:require_following_minimum] == ""}
        #when the requirement is fitting
        fitting_follower_requirement_campaigns = @campaigns.select{|c| 
          if  c[:require_following_minimum].class == Integer 
            cc[:instagram_follower] >= c[:require_following_minimum]
          end
        }
        @campaigns = no_follower_requirement_campaigns
        @campaigns << fitting_follower_requirement_campaigns
        @campaigns = @campaigns.flatten.uniq
        #  filtered_follower_number_campaign


        #filter with requirement FEMALE FOLLOWER RATIO 
        #when the cc input the female following ratio
        if cc[:instagram_female_follower_ratio].class != NilClass && cc[:instagram_female_follower_ratio] != ""
          #when there is no campaign ratio requirement
          no_female_ratio_requirement_campaigns =  @campaigns.select{|c| c[:require_following_female_ratio].class == NilClass || c[:require_following_female_ratio] == ""}
          #when there is fitting requirements
          fitting_female_ratio_requirement_campaigns = @campaigns.select{|c| 
            if  c[:require_following_female_ratio].class == Integer 
              cc[:instagram_female_follower_ratio] >= c[:require_following_female_ratio]
            end
          }
          @campaigns = no_female_ratio_requirement_campaigns
          @campaigns << fitting_female_ratio_requirement_campaigns
          @campaigns = @campaigns.flatten.uniq
          # filtered_follower_campaign

        else #the cc did NOT input the female following ratio
          @campaigns
        end


        #filter with requirement CC GENDER
        #if cc disclose the gender
        gender_arr = ['female', 'male', 'lgbtq and others']
        if gender_arr.include?(cc[:gender].downcase) 
          no_gender_requirement_campaigns = @campaigns.select{|c| gender_arr.include?(c[:require_gender].downcase) == false}
          fitting_gender_requirement_campaigns = @campaigns.select{|c| c[:require_gender].downcase == cc[:gender].downcase}
          @campaigns = no_gender_requirement_campaigns
          @campaigns << fitting_gender_requirement_campaigns
          @campaigns = @campaigns.flatten.uniq
        else # cc did NOT disclose the gender
          @campaigns
        end

    end

    render json: @campaigns

  end

  # GET /campaigns/1
  def show
    render json: @campaign
  end

  # POST /campaigns
  def create
    @campaign = Campaign.create!(campaign_params)
      render json: @campaign, status: :created, location: @campaign
  end

  # PATCH/PUT /campaigns/1
  def update
    if @campaign.update(campaign_params)
      render json: @campaign
    else
      render json: @campaign.errors, status: :unprocessable_entity
    end
  end

  # DELETE /campaigns/1
  def destroy
    current_user = User.find_by(platform_user_id: @campaign.business_id, platform_user_type: "Business")
    users = @campaign.content_creators
    users.map{|u| 
       Notification.create!(
        user_id:u.id, 
        source_user_id: current_user.id, 
        content: "Campaign Cancellation: #{current_user.username} cancelled their #{@campaign.name}", 
        read:false)
    }
    @campaign.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campaign_params
      params.require(:campaign).permit(:business_id, :name, :image, :location_name, :location_type, :address, 
        :city, :state, :zip, :country, :compensation_type, :compensation_market_value, :start_date, :end_date, 
        :application_deadline, :require_following_minimum, :require_following_location, :require_following_female_ratio, 
        :require_gender, :require_others, :description, :content_sent_by, :must_post_by, :search, :sort, :compensation, 
        :qualification)
    end


    def render_not_found_response
      render json: {error: "Camper not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
