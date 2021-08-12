class Campaign < ApplicationRecord
    belongs_to :business

    has_many :collabs
    has_many :content_creators, through: :collabs

    has_many :applications
    has_many :applicants, through: :applications

    has_many :invitations
    has_many :invitees, through: :invitations

    has_many :referral_services
    has_many :choices, through: :referral_services
end
