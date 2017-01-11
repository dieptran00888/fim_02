class Song < ApplicationRecord
  has_many :lyrics, dependent: :destroy
  has_many :ratings, as: :ratable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :artist_songs
  has_many :artists, through: :artist_songs
  has_many :album, through: :album_songs, polymorphic: true
  has_many :favourites, dependent: :destroy
end
