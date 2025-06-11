class Bookmark < ApplicationRecord
  # The Bookmark model represents a many-to-many relationship between lists and movies.
  # It allows users to bookmark movies within specific lists, along with an optional comment.
  # The model includes validations to ensure the presence of required attributes and uniqueness of movie-list combinations.

  # Associations
  # A bookmark belongs to a list and a movie.
  belongs_to :list
  belongs_to :movie

  # Validations
  # The comment must be present and at least 6 characters long.
  # The movie and list must be present.
  # The movie_id must be unique within the scope of the list_id to prevent duplicate bookmarks.
  validates :comment, presence: true, length: { minimum: 6 }
  validates :movie, presence: true
  validates :list, presence: true
  validates :movie_id, uniqueness: { scope: :list_id, message: 'This movie is already bookmarked in this list.' }
end
