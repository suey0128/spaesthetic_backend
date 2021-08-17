class RenameLogoToProfilePicInBusinesses < ActiveRecord::Migration[6.1]
  def change
    rename_column :businesses, :logo, :profile_pic
  end
end
