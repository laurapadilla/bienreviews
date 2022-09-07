# frozen_string_literal: true

# this is my model for the reviews

class Review < ApplicationRecord
  validates :title, presence: true
  validates :body, length: { minimum: 10 }, presence: true
  validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }, presence: true
end
