class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :update, :destroy]

  # GET /campaigns
  def index
    @campaigns = Campaign.all

    render json: @campaigns
  end

  # GET /campaigns/1
  def show
    render json: @campaign
  end

  # POST /campaigns
  def create
    @campaign = Campaign.new(campaign_params)

    if @campaign.save
      render json: @campaign, status: :created, location: @campaign
    else
      render json: @campaign.errors, status: :unprocessable_entity
    end
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
      params.require(:campaign).permit(:business_id, :name, :image, :location_name, :location_type, :address, :city, :state, :zip, :country, :compensation_type, :compensation_market_value, :start_date, :end_date, :application_deadline, :require_following_minimum, :require_following_location, :require_following_female_ratio, :require_gender, :require_others, :description, :content_sent_by, :must_post_by)
    end
end
