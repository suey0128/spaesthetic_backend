class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  # GET /invitations
  def index
    @invitations = Invitation.all

    render json: @invitations
  end

  # GET /invitations/1
  def show
    render json: @invitation
  end

  # POST /invitations
  def create
    @invitation = Invitation.create!(invitation_params)
    campaign = Campaign.find_by(id: @invitation.campaign_id)
    current_user = User.find_by(platform_user_id: campaign.business_id, platform_user_type: "Business")
    user = User.find_by(platform_user_id: @invitation.content_creator_id, platform_user_type: "ContentCreator")
    notification = Notification.create!(
      user_id:user.id, 
      source_user_id: current_user.id, 
      content: "New Invitation: #{current_user.username} invited you to their campaign: #{campaign.name}", 
      read:false)

      render json: @invitation, status: :created, location: @invitation

  end

  # PATCH/PUT /invitations/1
  def update
    if @invitation.update(invitation_params)
      render json: @invitation
    else
      render json: @invitation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /invitations/1
  def destroy
    @invitation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invitation
      @invitation = Invitation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invitation_params
      params.require(:invitation).permit(:content_creator_id, :campaign_id, :note)
    end

    def render_not_found_response
      render json: {error: "Camper not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
