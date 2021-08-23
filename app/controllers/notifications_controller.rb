class NotificationsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        @notifications = Notification.all
        
        if params[:userId]
            @notifications = @notifications.select{|n| n.user_id == params[:userId].to_i }
        end

        render json: @notifications.sort_by{|c| c[:created_at]}.reverse, include: :source
    end

    def update
        notifications = Notification.all.select{|n| n.user_id == params[:id].to_i && n.read == false}
        notifications.map{|n| n.update!(read: true)}
        render json: notifications.sort_by{|c| c[:created_at]}.reverse
    end


    private
    def render_not_found_response
        render json: {error: "notifications not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
