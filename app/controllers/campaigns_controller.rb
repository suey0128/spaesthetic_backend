class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  # GET /campaigns
  def index
    @campaigns = Campaign.all.select{|c| c[:application_deadline] > Date.today}.sort_by{|c| c[:created_at]}.reverse
    # available_campaigns = @campaigns.select{|c| c[:application_deadline] > Date.today}
    # @campaigns = available_campaigns.sort_by{|c| c[:created_at]}.reverse

    if params[:search]
      @campaigns = @campaigns.select { |c|
        "#{c.name}_#{c.location_name}_#{c.location_type}_#{c.address}_#{c.city}_#{c.state}_#{c.description}".downcase.gsub(" ", "_").include?(params[:search])
      }
    end

    if params[:sort]
      if params[:sort] == "newPost"
        @campaigns = @campaigns.sort_by{|c| c[:created_at]}
      elsif params[:sort] == "applyBy"
        @campaigns = @campaigns.sort_by{|c| c[:application_deadline]}
      elsif params[:sort] == "startDate"
        @campaigns = @campaigns.sort_by{|c| c[:start_date]}
      elsif params[:sort] == "endDate"
        @campaigns = @campaigns.sort_by{|c| c[:end_date]}
      elsif params[:sort] == "mustPostBy"
        @campaigns = @campaigns.sort_by{|c| c[:must_post_by]}
      elsif params[:sort] == "mustSentBy" 
        @campaigns = @campaigns.sort_by{|c| c[:content_sent_by]}
      elsif params[:sort] == "compensationMarketValue" 
        @campaigns = @campaigns.sort_by{|c| c[:compensation_market_value]}.reverse
      end
    end

    if params[:compensation]
      # byebug
      @campaigns = @campaigns.select{|c| c[:compensation_type] == params[:compensation]}
    end



    render json: @campaigns
    # render json: @campaigns.sort_by{|c| c[:updated_at]}.reverse
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
