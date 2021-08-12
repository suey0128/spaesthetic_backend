class ContentCreator < ApplicationRecord
    has_secure_password

    has_many :collabs
    has_many :campaigns, through: :collabs

    has_many :applications
    has_many :employers, through: :applications

    has_many :invitations
    has_many :inviters, through: :invitations

    has_many :referral_services
    has_many :customers, through: :referral_services

    has_many :reviews, as: :reviewee, class_name: "Review"
    has_many :reviewers, through: :reviews, source: :reviewer, source_type:"Business"

    has_many :written_reviews, as: :reviewer, class_name: "Review"
    has_many :reviewees, through: :written_reviews, source: :reviewee, source_type:"Business"

    has_many :messages, as: :receiver, class_name: "Message"
    has_many :writers, through: :messages, source: :writer, source_type:"Business"

    has_many :written_messages, as: :writer, class_name: "Message"
    has_many :receivers, through: :written_messages, source: :receiver, source_type:"Business"

    # Returns the hash digest of the given string.
    def self.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end
