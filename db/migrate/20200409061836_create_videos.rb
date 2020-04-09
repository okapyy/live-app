class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.text :video, null: false
      t.text :artist
      t.text :song_title
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
