class Review < ApplicationRecord
  # Each review belongs to a list.
  belongs_to :list

  # The content of the review must be present.
  validates :content, presence: true
  # The rating must be present, must be an integer, and must be between 0 and 5.
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
