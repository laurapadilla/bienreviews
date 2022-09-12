# frozen_string_literal: true

# this is my model file for the comment model. This is where you add validations and model-specific info

class Comment < ApplicationRecord
  belongs_to :review

  validates :body, presence: true
end
