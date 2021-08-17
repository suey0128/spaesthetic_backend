class ContentCreatorSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :gender, :instagram_username, :instagram_url, 
    :instagram_follower, :instagram_female_follower_ratio, :instagram_top1_follow_location, 
    :instagram_connection_permission, :ave_rate_per_campaign, :paypal_account, :profile_pic, 
    :website, :about_me
end
