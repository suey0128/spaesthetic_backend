class BusinessSerializer < ActiveModel::Serializer
  attributes :id, :name,:business_type, :profile_pic, :description, :address, :city, :state, :zip, :country, 
  :website, :user, 
  #from table relationship
  :campaigns,
  #from custom methods
  :cc_I_worked_with, :current_campaigns, :past_campaigns, :reviews_on_me
end
