class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.integer :writer_id
      t.string :writer_type
      t.integer :receiver_id
      t.string :receiver_type
      t.string :content

      t.timestamps
    end
  end
end
