class CollabsController < ApplicationController
  before_action :set_collab, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  # GET /collabs
  def index
    @collabs = Collab.all

    render json: @collabs
  end

  # GET /collabs/1
  def show
    render json: @collab
  end

  # POST /collabs
  def create
    @collab = Collab.create!(collab_params)
    application = Application.find_by(collab_params)
    application.destroy
    render json: @collab, status: :created, location: @collab
  end

  # PATCH/PUT /collabs/1
  def update
    if @collab.update(collab_params)
      render json: @collab
    else
      render json: @collab.errors, status: :unprocessable_entity
    end
  end

  # DELETE /collabs/1
  def destroy
    #destory the application instance
    # @application = Application.find_by(content_creator_id: @collab.content_creator_id, campaign_id: @collab.campaign_id )
    # @application.destroy
    #destroy the collab instance
    @collab.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collab
      @collab = Collab.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collab_params
      params.require(:collab).permit(:content_creator_id, :campaign_id, :note)
    end

    def render_not_found_response
      render json: {error: "Camper not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
