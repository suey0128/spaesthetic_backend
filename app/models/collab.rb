class Collab < ApplicationRecord
    belongs_to :content_creator
    belongs_to :campaign

    has_many :notifications, as: :notification_reason
    has_many :users, through: :notifications, as: :notification_reason
end
