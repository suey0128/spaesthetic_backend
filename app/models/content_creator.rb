class ContentCreator < ApplicationRecord
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

    has_many :received_messages, as: :receiver, class_name: "Message"
    has_many :writers, through: :received_messages, source: :writer, source_type:"Business"

    has_many :written_messages, as: :writer, class_name: "Message"
    has_many :receivers, through: :written_messages, source: :receiver, source_type:"Business"

    has_one :user, as: :platform_user

    validates :first_name, :last_name, presence: true
    validates :instagram_username, presence: true, uniqueness: { case_sensitive: false }
    validates :instagram_follower, presence: true, numericality: { only_integer: true }



    #custom methods
    def current_campaigns
        current_c = self.campaigns.select{|c| c.end_date > DateTime.now }
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
        past_c = self.campaigns.select{|c| c.end_date < DateTime.now }
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
        self.reviews.map{|r| {
            id: r.id, reviewer:r.reviewer, content:r.content, date:r.updated_at, rating: r.rating
            }}.sort_by{|r| r[:date]}.reverse
    end
end
