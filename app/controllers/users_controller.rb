class UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    #when the user signup, the id is stored in session(cookie), find the user using cookie
    @user = User.find_by(id: session[:user_id])
    if @user
        render json: @user
    else
        render json: { error: "Not authorized"}, status: :unauthorized
    end
  end

  # POST /users
  def create
    if params[:business] 
      business = Business.create!(business_params)
      @user = User.new(user_params)
      @user.update!(platform_user_id: business.id, platform_user_type: "Business")
    elsif params[:content_creator]
      content_creator = ContentCreator.create!(content_creator_params)
      @user = User.new(user_params)
      @user.update!(platform_user_id: content_creator.id, platform_user_type: "ContentCreator")
    end
    Notification.create!(user_id:@user.id, source_user_id:11,
      content: "Welcome to Spaesthetic!🥰  Please finish updating your profile to attract more collabs ♥️ ", 
      read:false)
    session[:user_id] = @user.id
    render json: @user, status: :created, location: @user
  end

  # PATCH/PUT /users/1
  def update
      #update @user
      @user.update!(user_params)
    if params[:business] 
      #find the business 
      business = Business.find_by(id: @user.platform_user_id)
      business = business.update!(business_params)
    elsif params[:content_creator]
      #find the cc 
      cc = ContentCreator.find_by(id: @user.platform_user_id)
      cc = cc.update!(content_creator_params)
    else
      @user.update!(params.permit(:username, :email, :password, :password_confirmation, :business))
    end
    render json: @user
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  # For user Login
  def login
    user = User.find_by(username: params[:user][:username])
    if user&.authenticate(params[:user][:password])

        session[:init] = true
        session[:user_id] = user.id
        render json: user
    else
        render json: { errors: ["Incorrect username and/or password"] }, status: :unauthorized
    end
  end

  # For user logout
  def logout
    session.delete(:user_id)
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params[:user].permit(:username, :email, :password, :password_confirmation, :business)
    end

    def business_params
      params[:business].permit(:name,:business_type, :profile_pic, :description, :address, :city, :state, :zip, :country, :website)
    end

    def content_creator_params
      params.require(:content_creator).permit(:first_name, :last_name, :gender, :instagram_username, 
        :instagram_url, :instagram_follower, :instagram_female_follower_ratio, :instagram_top1_follow_location, 
        :instagram_connection_permission, :ave_rate_per_campaign, :paypal_account, :website, :profile_pic)
    end

    def render_not_found_response
      render json: {error: "User not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
