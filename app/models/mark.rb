class Mark < ApplicationRecord
  belongs_to :user
  belongs_to :song

  scope :favorite_song_ids_of_user, -> user_id do
    where(user_id: user_id, is_favorite: true).pluck :song_id
  end
end
