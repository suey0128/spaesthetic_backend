class InvitationSerializer < ActiveModel::Serializer
  attributes :id, :content_creator_id, :campaign_id, :note
end
