class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :password_digest, :platform_user_id, :platform_user_type, :platform_user
end
