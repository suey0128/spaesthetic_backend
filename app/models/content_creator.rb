class ContentCreator < ApplicationRecord
    has_many :collabs
    has_many :businesses, through: :collabs

    has_many :applications
    has_many :employers, through: :applications

    has_many :invitations
    has_many :inviters, through: :invitations

    has_many :referral_services
    has_many :customers, through: :referral_services

    has_many :content_creator_reviews, as: :reviewee, class_name: "Review"

    has_many :written_reviews, as: :reviewer, class_name: "Review"
end
