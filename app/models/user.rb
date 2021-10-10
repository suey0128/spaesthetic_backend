class User < ApplicationRecord
    has_secure_password

    belongs_to :platform_user, polymorphic: true

    has_many :notifications
    has_many :collabs, through: :notifications, source: :notification_reason, source_type: "Collab"
    has_many :applications, through: :notifications, source: :notification_reason, source_type: "Application"
    has_many :invitations, through: :notifications, source: :notification_reason, source_type: "Invitation"
    has_many :reviews, through: :notifications, source: :notification_reason, source_type: "Review"

    # Returns the hash digest of the given string.
    def self.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    #validations
    validates :username, :email, presence: true, uniqueness: { case_sensitive: false }
    # validates :email, presence: true, uniqueness: true


    #customer methods
    def current_campaigns
        current_c = self.platform_user.campaigns.select{|c| c.end_date > DateTime.now }
        current_c.map{|c| {
            :id => c.id, :business_id=>c.business_id, :name=>c.name, :image=>c.image, :location_name=>c.location_name, 
            :location_type=>c.location_type, :address=>c.address, :city=>c.city, :state=>c.state, :zip=>c.zip, :country=>c.country, 
            :compensation_type=>c.compensation_type, :compensation_market_value=>c.compensation_market_value, 
            :start_date=>c.start_date, :end_date=>c.end_date, :application_deadline=>c.application_deadline, 
            :require_following_minimum=>c.require_following_minimum, :require_following_location=>c.require_following_location, 
            :require_following_female_ratio=>c.require_following_female_ratio, :require_gender=>c.require_gender, 
            :require_others=>c.require_others, :description=>c.description, :content_sent_by=>c.content_sent_by, 
            :must_post_by=>c.must_post_by, :business=>c.business, :collabs=>c.collabs, :applications=>c.applications,
            :updated_at=>c.updated_at, :applicants=>c.applicants, :invitees=> c.invitees, :content_creators=>c.content_creators
         }}.sort_by{|c| c[:updated_at]}.reverse
    end

    def past_campaigns
        past_c = self.platform_user.campaigns.select{|c| c.end_date < DateTime.now }
        past_c.map{|c| {
            :id => c.id, :business_id=>c.business_id, :name=>c.name, :image=>c.image, :location_name=>c.location_name, 
            :location_type=>c.location_type, :address=>c.address, :city=>c.city, :state=>c.state, :zip=>c.zip, :country=>c.country, 
            :compensation_type=>c.compensation_type, :compensation_market_value=>c.compensation_market_value, 
            :start_date=>c.start_date, :end_date=>c.end_date, :application_deadline=>c.application_deadline, 
            :require_following_minimum=>c.require_following_minimum, :require_following_location=>c.require_following_location, 
            :require_following_female_ratio=>c.require_following_female_ratio, :require_gender=>c.require_gender, 
            :require_others=>c.require_others, :description=>c.description, :content_sent_by=>c.content_sent_by, 
            :must_post_by=>c.must_post_by, :business=>c.business, :collabs=>c.collabs, :applications=>c.applications,
            :updated_at=>c.updated_at, :applicants=>c.applicants, :invitees=> c.invitees, :content_creators=>c.content_creators
         }}.sort_by{|c| c[:updated_at]}.reverse
        
    end

    def reviews_on_me
        self.platform_user.reviews.map{|r| {
            id: r.id, reviewer:r.reviewer, content:r.content, date:r.updated_at, rating: r.rating
            }}.sort_by{|r| r[:date]}.reverse
        
    end

    def reviews_i_wrote
        self.platform_user.written_reviews.map{|r| {
            id: r.id, reviewee:r.reviewee, content:r.content, date:r.updated_at, rating: r.rating
            }}.sort_by{|r| r[:date]}.reverse
    end

    # as CC
    def applied_campaigns
        if self.platform_user_type == "ContentCreator"
            return self.platform_user.employers.map{|c| {
                :id => c.id, :business_id=>c.business_id, :name=>c.name, :image=>c.image, :location_name=>c.location_name, 
                :location_type=>c.location_type, :address=>c.address, :city=>c.city, :state=>c.state, :zip=>c.zip, :country=>c.country, 
                :compensation_type=>c.compensation_type, :compensation_market_value=>c.compensation_market_value, 
                :start_date=>c.start_date, :end_date=>c.end_date, :application_deadline=>c.application_deadline, 
                :require_following_minimum=>c.require_following_minimum, :require_following_location=>c.require_following_location, 
                :require_following_female_ratio=>c.require_following_female_ratio, :require_gender=>c.require_gender, 
                :require_others=>c.require_others, :description=>c.description, :content_sent_by=>c.content_sent_by, 
                :must_post_by=>c.must_post_by, :business=>c.business, :collabs=>c.collabs, :applications=>c.applications,
                :updated_at=>c.updated_at
                }}.sort_by{|c| c[:updated_at]}.reverse
        end
    end

    def invited_by
        if self.platform_user_type == "ContentCreator"
            return self.platform_user.inviters.map{|c| { 
                :id => c.id, :business_id=>c.business_id, :name=>c.name, :image=>c.image, :location_name=>c.location_name, 
                :location_type=>c.location_type, :address=>c.address, :city=>c.city, :state=>c.state, :zip=>c.zip, :country=>c.country, 
                :compensation_type=>c.compensation_type, :compensation_market_value=>c.compensation_market_value, 
                :start_date=>c.start_date, :end_date=>c.end_date, :application_deadline=>c.application_deadline, 
                :require_following_minimum=>c.require_following_minimum, :require_following_location=>c.require_following_location, 
                :require_following_female_ratio=>c.require_following_female_ratio, :require_gender=>c.require_gender, 
                :require_others=>c.require_others, :description=>c.description, :content_sent_by=>c.content_sent_by, 
                :must_post_by=>c.must_post_by, :business=>c.business, :collabs=>c.collabs, :applications=>c.applications,
                :updated_at=>c.updated_at
             }}.sort_by{|c| c[:updated_at]}.reverse
        end
    end


end
