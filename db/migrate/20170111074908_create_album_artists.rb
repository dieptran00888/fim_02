class CreateAlbumArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :album_artists do |t|
      t.integer :album_id
      t.integer :artist_id

      t.timestamps
    end
  end
end
