class Song < ApplicationRecord
  has_many :lyrics, dependent: :destroy
  has_many :ratings, as: :rateable, class_name: Rate.name,
    dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :artist_songs
  has_many :artists, through: :artist_songs
  has_many :favourites, dependent: :destroy

  has_many :album_songs
  has_many :albums, through: :album_songs

  belongs_to :category
  belongs_to :artist

  validates :name, presence: true
  validates :url_content, presence: true
  validates :composer_id, presence: true
  validates :singer_id, presence: true
  validates :category_id, presence: true

  ratyrate_rateable "evaluation"
  is_impressionable counter_cache: true, column_name: :views

  scope :of_ids, -> ids {where id: ids}
end
