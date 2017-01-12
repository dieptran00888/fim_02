class User < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :ratings, as: :ratable, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :lyrics, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :favourites, as: :favouritable, dependent: :destroy

  accepts_nested_attributes_for :albums
  
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  validates :name, presence: true, length: {maximum: 50}

  enum gender: [:male, :female]

  ATTRIBUTES_PARAMS = [:name, :gender, :date_of_birth,:email,
    :password, :password_confirmation]
end
