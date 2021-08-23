class Review < ApplicationRecord
    belongs_to :reviewer, polymorphic: true
    belongs_to :reviewee, polymorphic: true

    has_many :notifications, as: :notification_reason
    has_many :users, through: :notifications, as: :notification_reason
end
