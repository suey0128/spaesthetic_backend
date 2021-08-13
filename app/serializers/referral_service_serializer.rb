class ReferralServiceSerializer < ActiveModel::Serializer
  attributes :id,:content_creator_id, :campaign_id, :employee_name
end
