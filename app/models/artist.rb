class Artist < ApplicationRecord
  has_many :artist_songs
  has_many :songs, through: :artist_songs
  has_many :album_artists
  has_many :album, through: :album_artists
end
