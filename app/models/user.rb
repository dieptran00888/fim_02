class User < ApplicationRecord

  ratyrate_rater
  acts_as_paranoid
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :ratings, as: :ratable, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :lyrics, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :favourites, as: :favouritable, dependent: :destroy

  accepts_nested_attributes_for :albums
  
  devise :database_authenticatable, :registerable, :rememberable, :validatable,
    :omniauthable, omniauth_providers: [:facebook]

  validates :name, presence: true, length: {maximum: 50}

  enum gender: [:male, :female]

  ATTRIBUTES_PARAMS = [:name, :gender, :date_of_birth, :email,
    :password, :password_confirmation]

  scope :all_customer, ->{where is_admin: false}

  def list_favorite_songs
    Song.of_ids Mark.favorite_song_ids_of_user self.id
  end

  def current_user? user
    self == user
  end

  class << self
    def from_omniauth auth
      User.find_or_create_by email: auth.info.email do |user|
        user.email = auth.info.email
        user.name = auth.info.name
        user.password = Devise.friendly_token[0, 20]
      end
    end

    def new_with_session params, session
      super.tap do |user|
        if data = session["devise.auth_data"] &&
          session["devise.auth_data"]["extra"]["raw_info"]
          user.email = data["email"]
        end
      end
    end
  end
end
