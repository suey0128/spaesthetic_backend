class CreateDirectMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :direct_messages do |t|
      t.integer :writer_id
      t.integer :receiver_id
      t.boolean :read
      t.text :content

      t.timestamps
    end
  end
end
