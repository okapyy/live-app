class Delete < ActiveRecord::Migration[5.2]
  def change
    drop_table :video_tags
    drop_table :tags
  end
end
