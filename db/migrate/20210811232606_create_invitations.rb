class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.integer :content_creator_id
      t.integer :campaign_id
      t.text :note

      t.timestamps
    end
  end
end
