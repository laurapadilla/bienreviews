# frozen_string_literal: true

# this is my model file for the review model. This is where you add validations and model-specific info
class Review < ApplicationRecord
  # add an association that has a 1-to-many relationship
  has_many :comments

  geocoded_by :address
  after_validation :geocode

  validates :title, presence: true
  validates :restaurant, presence: true
  validates :body, length: { minimum: 10 }
  validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  validates :address, presence: true

  profanity_filter :body

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
