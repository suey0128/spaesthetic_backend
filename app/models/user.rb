class User < ApplicationRecord
    has_secure_password

    belongs_to :platform_user, polymorphic: true

    # Returns the hash digest of the given string.
    def self.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    #validations
    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence: true, on: :create
    validates :email, presence: true, uniqueness: true

    #customer methods

    def current_campaigns
        self.platform_user.campaigns.select{|c| c.end_date > DateTime.now }
    end

    def past_campaigns
        self.platform_user.campaigns.select{|c| c.end_date < DateTime.now }
    end

    def reviews_on_me
        self.platform_user.reviews
    end

    def reviews_i_wrote
        self.platform_user.written_reviews
    end

    # as CC
    def applied_campaigns
        if self.platform_user_type == "ContentCreator"
            return self.platform_user.employers
        end
    end

    def invited_by
        if self.platform_user_type == "ContentCreator"
            return self.platform_user.customers
        end
    end

end
