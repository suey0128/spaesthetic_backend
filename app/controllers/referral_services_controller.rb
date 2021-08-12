class ReferralServicesController < ApplicationController
  before_action :set_referral_service, only: [:show, :update, :destroy]

  # GET /referral_services
  def index
    @referral_services = ReferralService.all

    render json: @referral_services
  end

  # GET /referral_services/1
  def show
    render json: @referral_service
  end

  # POST /referral_services
  def create
    @referral_service = ReferralService.new(referral_service_params)

    if @referral_service.save
      render json: @referral_service, status: :created, location: @referral_service
    else
      render json: @referral_service.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /referral_services/1
  def update
    if @referral_service.update(referral_service_params)
      render json: @referral_service
    else
      render json: @referral_service.errors, status: :unprocessable_entity
    end
  end

  # DELETE /referral_services/1
  def destroy
    @referral_service.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referral_service
      @referral_service = ReferralService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def referral_service_params
      params.require(:referral_service).permit(:content_creator_id, :campaign_id, :employee_name)
    end
end
