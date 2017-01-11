class CreateArtistSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_songs do |t|
      t.integer :song_id
      t.integer :artist_id

      t.timestamps
    end
  end
end
