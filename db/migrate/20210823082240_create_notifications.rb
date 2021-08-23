class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :notification_reason_id
      t.string :notification_reason_type
      t.text :content
      t.boolean :read

      t.timestamps
    end
  end
end
