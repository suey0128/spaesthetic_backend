class NotificationSerializer < ApplicationSerializer
  attributes :id, :user_id, :notification_reason_id, :notification_reason_type, :content, :read
end
