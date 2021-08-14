class User < ApplicationRecord
    has_secure_password

    belongs_to :platform_user, polymorphic: true

    # Returns the hash digest of the given string.
    def self.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence: true, on: :create
    validates :email, presence: true, uniqueness: true
end
