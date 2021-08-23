class Invitation < ApplicationRecord
    belongs_to :inviter, :class_name =>"Campaign", :foreign_key =>"campaign_id"
    belongs_to :invitee, :class_name =>"ContentCreator", :foreign_key =>"content_creator_id"

    # has_many :notifications, as: :notification_reason
    # has_many :users, through: :notifications, as: :notification_reason
end
