class AddUserNameToBusinesses < ActiveRecord::Migration[6.1]
  def change
    add_column :businesses, :username, :string
  end
end
