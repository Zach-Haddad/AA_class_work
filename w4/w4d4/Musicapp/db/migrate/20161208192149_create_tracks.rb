class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id, null:false
      t.integer :ord, null:false
      t.string :name, null:false

      t.timestamps null: false
    end
  end
end
