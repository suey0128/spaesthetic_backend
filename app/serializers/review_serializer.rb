class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :reviewee_id, :reviewee_type, :reviewer_id, :reviewer_type, :rating, :content, :updated_at
end
