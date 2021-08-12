class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.integer :content_creator_id
      t.integer :campaign_id
      t.string :note

      t.timestamps
    end
  end
end
