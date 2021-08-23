class DirectMessageSerializer < ApplicationSerializer
  attributes :id, :writer_id, :receiver_id, :read, :content
end
