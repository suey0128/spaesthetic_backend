class Notification < ApplicationRecord
    belongs_to :user
    belongs_to :notification_reason, polymorphic: true
end
