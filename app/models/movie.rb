class Movie < ApplicationRecord
  # The Movie model represents a movie in the application.
  # A movie has many bookmarks, and if a movie is destroyed, its bookmarks will also be destroyed.
  has_many :bookmarks, dependent: :destroy

  # The tile must be present and unique.
  validates :title, presence: true, uniqueness: true
  # The overview (description) must be present.
  validates :overview, presence: true
end
