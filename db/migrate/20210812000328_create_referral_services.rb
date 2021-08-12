class CreateReferralServices < ActiveRecord::Migration[6.1]
  def change
    create_table :referral_services do |t|
      t.integer :content_creator_id
      t.integer :campaign_id
      t.string :employee_name

      t.timestamps
    end
  end
end
