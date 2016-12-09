class AddRecordingtoAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :recording, :string, limit: 1, null: false
  end
end
