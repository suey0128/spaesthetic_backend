class AddAboutMeToContentCreators < ActiveRecord::Migration[6.1]
  def change
    add_column :content_creators, :about_me, :text
  end
end
