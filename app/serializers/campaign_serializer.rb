class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :business_id, :name, :image, :location_name, :location_type, :address, :city, :state, :zip, :country, 
    :compensation_type, :compensation_market_value, :start_date, :end_date, :application_deadline, :require_following_minimum, 
    :require_following_location, :require_following_female_ratio, :require_gender, :require_others, :description, 
    :content_sent_by, :must_post_by, 
    # from table relationships
    :business, :invitees, :applicants, :content_creators
end
