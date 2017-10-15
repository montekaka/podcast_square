class CreatePodcasts < ActiveRecord::Migration[5.1]
  def change
    create_table :podcasts do |t|
      t.string :name
      t.string :itunes_id
      t.string :rss_feed
      t.string :email

      t.timestamps
    end
  end
end
