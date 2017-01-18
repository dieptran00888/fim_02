class Lyric < ApplicationRecord
  belongs_to :user
  belongs_to :song

  enum status: {pending: 0, approved: 1}
end
