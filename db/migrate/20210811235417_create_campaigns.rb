class CreateCampaigns < ActiveRecord::Migration[6.1]
  def change
    create_table :campaigns do |t|
      t.integer :business_id
      t.string :name
      t.string :image
      t.string :location_name
      t.string :location_type
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.string :compensation_type
      t.float :compensation_market_value
      t.date :start_date
      t.date :end_date
      t.date :application_deadline
      t.integer :require_following_minimum
      t.string :require_following_location
      t.integer :require_following_female_ratio
      t.string :require_gender
      t.string :require_others
      t.string :description
      t.date :content_sent_by
      t.date :must_post_by

      t.timestamps
    end
  end
end
