class CreateCollabs < ActiveRecord::Migration[6.1]
  def change
    create_table :collabs do |t|
      t.integer :content_creator_id
      t.integer :campaign_id
      t.text :note

      t.timestamps
    end
  end
end
