class User < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :ratings, as: :ratable, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :lyrics, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :favourites, as: :favouritable, dependent: :destroy

  accepts_nested_attributes_for :albums
end
