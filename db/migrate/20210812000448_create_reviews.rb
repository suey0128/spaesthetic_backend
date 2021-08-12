class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :reviewee_id
      t.string :reviewee_type
      t.integer :reviewer_id
      t.string :reviewer_type
      t.float :rating
      t.text :content

      t.timestamps
    end
  end
end
