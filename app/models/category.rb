class Category < ApplicationRecord
  has_many :albums

  validates :name, presence: true, length: {maximum: 50}

  acts_as_tree dependent: :delete_all
end
