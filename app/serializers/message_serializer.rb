class MessageSerializer < ActiveModel::Serializer
  attributes :id, :writer_id, :writer_type, :receiver_id, :receiver_type, :content, :read
end
