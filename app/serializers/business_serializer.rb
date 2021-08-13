class BusinessSerializer < ActiveModel::Serializer
  attributes :id, :name,:business_type, :logo, :description, :address, :city, :state, :zip, :country, :website, :user
end
