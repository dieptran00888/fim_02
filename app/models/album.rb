class Album < ApplicationRecord
  has_many :album_songs, dependent: :destroy
  has_many :songs, through: :album_songs
  has_many :ratings, as: :rateable, class_name: Rate.name,
    dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :album_artists, dependent: :destroy
  has_many :artists, through: :album_artists

  belongs_to :category
  belongs_to :user

  has_attached_file :avatar, styles: {medium: "300x300>", thumb: "100x100>"}
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  accepts_nested_attributes_for :songs, allow_destroy: true,
    reject_if: :all_blank

  enum album_type: [:album, :favorite]

  validates :name, presence: true, length: {maximum: 255}
  validate :at_least_one_song

  ratyrate_rateable "evaluation"
  is_impressionable counter_cache: true, column_name: :views
  scope :order_rate, ->{order avg_rates: :DESC}

  private
  def at_least_one_song
    if self.songs.size < 1
      errors.add :base, I18n.t("flash.at_least_one_song")
    end
  end
end
