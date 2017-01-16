class Song < ApplicationRecord
  has_many :lyrics, dependent: :destroy
  has_many :ratings, as: :ratable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :artist_songs
  has_many :artists, through: :artist_songs
  has_many :favourites, dependent: :destroy

  has_many :album_songs
  has_many :albums, through: :album_songs

  validates :name, presence: true
  validates :url_content, presence: true
  validates :composer_id, presence: true
  validates :singer_id, presence: true
  validates :category_id, presence: true
end
