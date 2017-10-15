class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :review_itunes_id
      t.string :author
      t.float :rating
      t.text :title
      t.text :content
      t.string :country_code

      t.timestamps
    end
  end
end
