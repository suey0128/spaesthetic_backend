class Application < ApplicationRecord
    belongs_to :employer, :class_name =>"Campaign", :foreign_key =>"campaign_id"
    belongs_to :applicant, :class_name =>"ContentCreator", :foreign_key =>"content_creator_id"
end
