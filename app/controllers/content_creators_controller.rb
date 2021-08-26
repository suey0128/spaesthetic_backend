class ContentCreatorsController < ApplicationController
  before_action :set_content_creator, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  # GET /content_creators
  def index
    @content_creators = ContentCreator.all.shuffle

    if params[:search]
      @content_creators = ContentCreator.all.select { |cc|
        "#{cc.first_name}_#{cc.last_name}_#{cc.instagram_username}_#{cc.about_me}_#{cc.gender}_#{cc.instagram_top1_follow_location}_#{cc.user.username}".downcase.gsub(" ", "_").include?(params[:search])
      }
    end
    
    if params[:sort]
      if params[:sort] == "followLtoS"
        @content_creators = ContentCreator.all.select{|cc| cc[:instagram_follower] != nil }
        @content_creators = @content_creators.sort_by{|cc| cc[:instagram_follower]}.reverse
      elsif params[:sort] == "followStoL"
        @content_creators = ContentCreator.all.select{|cc| cc[:instagram_follower] != nil   }
        @content_creators = @content_creators.sort_by{|cc| cc[:instagram_follower]}
      elsif params[:sort] == "luck"
        @content_creators = ContentCreator.all.shuffle
      elsif params[:sort] == "femaleFollowLtoS"
        @content_creators = ContentCreator.all.select{|cc| cc[:instagram_female_follower_ratio] != nil }
        @content_creators = @content_creators.sort_by{|cc| cc[:instagram_female_follower_ratio]}.reverse
      elsif params[:sort] == "femaleFollowStoL"
        @content_creators = ContentCreator.all.select{|cc| cc[:instagram_female_follower_ratio] != nil }
        @content_creators = @content_creators.sort_by{|cc| cc[:instagram_female_follower_ratio]}
      elsif params[:sort] == "mostworkedWith" 
        @content_creators = ContentCreator.all.sort_by{|cc| cc.collabs.count}.reverse
      elsif params[:sort] == "mostInvited" 
        @content_creators = ContentCreator.all.sort_by{|cc| cc.invitations.count}.reverse
      end
    end

    render json: @content_creators

  end

  # GET /content_creators/1
  def show
    render json: @content_creator
  end

  # POST /content_creators
  def create
    @content_creator = ContentCreator.create!(content_creator_params)
      render json: @content_creator, status: :created, location: @content_creator

  end

  # PATCH/PUT /content_creators/1
  def update
      @content_creator.update!(content_creator_params)
      render json: @content_creator
  end

  # DELETE /content_creators/1
  def destroy
    @content_creator.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_creator
      @content_creator = ContentCreator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_creator_params
      params.require(:content_creator).permit(:id, :first_name, :last_name, :gender, :instagram_username, :instagram_url, 
        :instagram_follower, :instagram_female_follower_ratio, :instagram_top1_follow_location, 
        :instagram_connection_permission, :ave_rate_per_campaign, :paypal_account, :profile_pic, 
        :website, :about_me, :search, :sort)
    end

    def render_not_found_response
      render json: {error: "Camper not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
