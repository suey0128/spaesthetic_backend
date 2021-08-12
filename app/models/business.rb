class Business < ApplicationRecord
    has_secure_password
    
    has_many :campaigns

    has_many :reviews, as: :reviewee, class_name: "Review"
    has_many :reviewers, through: :reviews, source: :reviewer, source_type:"ContentCreator"

    has_many :written_reviews, as: :reviewer, class_name: "Review"
    has_many :reviewees, through: :written_reviews, source: :reviewee, source_type:"ContentCreator"

    has_many :messages, as: :receiver, class_name: "Message"
    has_many :writers, through: :messages, source: :writer, source_type:"ContentCreator"

    has_many :written_messages, as: :writer, class_name: "Message"
    has_many :receivers, through: :written_messages, source: :receiver, source_type:"ContentCreator"

    # Returns the hash digest of the given string.
    def self.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

end
