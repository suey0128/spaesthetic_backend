class Campaign < ApplicationRecord
    belongs_to :business

    has_many :collabs, dependent: :destroy
    has_many :content_creators, through: :collabs

    has_many :applications, dependent: :destroy
    has_many :applicants, through: :applications

    has_many :invitations, dependent: :destroy
    has_many :invitees, through: :invitations

    has_many :referral_services, dependent: :destroy
    has_many :choices, through: :referral_services

    validates :start_date, :end_date, :application_deadline, :content_sent_by, :must_post_by,
        :name,:description, presence: true
end
