class ContentCreatorsController < ApplicationController
  before_action :set_content_creator, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  # GET /content_creators
  def index
    @content_creators = ContentCreator.all

    render json: @content_creators
  end

  # GET /content_creators/1
  def show
    render json: @content_creator
  end

  # POST /content_creators
  def create
    @content_creator = ContentCreator.new(content_creator_params)

    if @content_creator.save
      render json: @content_creator, status: :created, location: @content_creator
    else
      render json: @content_creator.errors, status: :unprocessable_entity
    end
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
        :website, :about_me)
    end

    def render_not_found_response
      render json: {error: "Camper not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
