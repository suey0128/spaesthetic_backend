class CreateBusinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :businesses do |t|
      t.string :username
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :business_type
      t.text :logo
      t.text :description
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.text :website

      t.timestamps
    end
  end
end
