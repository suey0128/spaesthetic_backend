class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :password_digest, :platform_user_id, :platform_user_type, 
    # from table relationship
    :platform_user,

    # from custom methods
    :current_campaigns, :past_campaigns, :reviews_on_me, :reviews_i_wrote,
    # as cc
    :applied_campaigns, :invited_by
    # #as biz
    # :invite_list

end
