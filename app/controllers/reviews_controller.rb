class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /reviews
  def index
    @reviews = Review.all

    render json: @reviews
  end

  # GET /reviews/1
  def show
    render json: @review
  end

  # POST /reviews
  def create
    @review = Review.create!(review_params)
      render json: @review, status: :created, location: @review
  end

  # PATCH/PUT /reviews/1
  def update
     @review.update(review_params)
      render json: @review
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:reviewee_id, :reviewee_type, :reviewer_id, :reviewer_type, :rating, :content)
    end

    def render_not_found_response
      render json: {error: "Camper not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
