# frozen_string_literal: true

# this is my model file for the review model. This is where you add validations and model-specific info
class Review < ApplicationRecord
  validates :title, presence: true
  validates :restaurant, presence: true
  validates :body, length: { minimum: 10 }
  validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
