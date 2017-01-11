class CreateAlbumSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :album_songs do |t|
      t.integer :album_id
      t.integer :song_id

      t.timestamps
    end
  end
end
