class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :platform_user_type
      t.integer :platform_user_id

      t.timestamps
    end
  end
end
