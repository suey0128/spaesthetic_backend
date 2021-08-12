class ReferralService < ApplicationRecord
    belongs_to :customer, :class_name =>"Campaign", :foreign_key =>"campaign_id"
    belongs_to :choice, :class_name =>"ContentCreator", :foreign_key =>"content_creator_id"
end
