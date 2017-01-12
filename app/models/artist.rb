class Artist < ApplicationRecord
  acts_as_paranoid

  has_many :artist_songs
  has_many :songs, through: :artist_songs
  has_many :album_artists
  has_many :album, through: :album_artists

  validates :name, presence: true, length: {minimum: 6}
  validates :type_of_music, presence: true
  validates :artist_type, presence: true

  enum artist_type: [:singer, :composer]
  enum type_of_music: [:pop, :jazz, :rock, :balad, :rap, :another]
end
