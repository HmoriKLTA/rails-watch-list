class List < ApplicationRecord
  # The List model represents a collection of movies that a user can create.
  # It includes associations with bookmarks and reviews, allowing users to bookmark movies and leave reviews for specific lists.
  # The model also includes validations to ensure the presence and uniqueness of the list name.

  # Associations
  # A list has many bookmarks and reviews.
  # It has many movies through bookmarks.
  # It has one attached photo.
  # IF a list is destroyed, its bookmarks and reviews are also destroyed.
  has_many :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_one_attached :photo

  # The name of the list must be present and unique.
  validates :name, presence: true, uniqueness: true
end
