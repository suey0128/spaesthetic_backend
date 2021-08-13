class CreateContentCreators < ActiveRecord::Migration[6.1]
  def change
    create_table :content_creators do |t|
      # t.string :username
      # t.string :email
      t.string :first_name
      t.string :last_name
      # t.string :password_digest
      t.string :gender
      t.string :instagram_username
      t.text :instagram_url
      t.integer :instagram_follower
      t.integer :instagram_female_follower_ratio
      t.string :instagram_top1_follow_location
      t.boolean :instagram_connection_permission
      t.integer :ave_rate_per_campaign
      t.string :paypal_account
      t.text :profile_pic
      t.text :website

      t.timestamps
    end
  end
end
