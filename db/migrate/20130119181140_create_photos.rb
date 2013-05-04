class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string   "user_photo_file_name"
      t.string   "user_photo_content_type"
      t.integer  "user_photo_file_size"
      t.datetime "user_photo_updated_at"
      t.timestamps
    end
  end
end
