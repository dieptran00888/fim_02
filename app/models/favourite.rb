class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :favouritable, polymorphic: true
end
