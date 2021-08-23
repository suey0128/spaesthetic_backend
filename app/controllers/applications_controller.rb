class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  # GET /applications
  def index
    @applications = Application.all

    render json: @applications
  end

  # GET /applications/1
  def show
    render json: @application
  end

  # POST /applications
  def create
    @application = Application.create!(application_params)
    campaign = Campaign.find_by(id: @application.campaign_id)
    business = Business.find_by(id: campaign.business_id)
    user = User.find_by(platform_user_id: business.id, platform_user_type: "Business")
    cc = ContentCreator.find_by(id: @application.content_creator_id)
    current_user = User.find_by(platform_user_id: cc.id, platform_user_type: "ContentCreator")
    notification = Notification.create!(
      user_id:user.id, 
      source_user_id: current_user.id, 
      content: "New Application: #{current_user.username} applied to your campaign: #{campaign.name}", 
      read:false)

      render json: @application, status: :created, location: @application

  end

  # PATCH/PUT /applications/1
  def update
    if @application.update(application_params)
      render json: @application
    else
      render json: @application.errors, status: :unprocessable_entity
    end
  end

  # DELETE /applications/1
  def destroy
    @application.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def application_params
      params.require(:application).permit(:content_creator_id, :campaign_id, :note)
    end


    def render_not_found_response
      render json: {error: "Camper not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
