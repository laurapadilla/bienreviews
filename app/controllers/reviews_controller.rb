class ReviewsController < ApplicationController
  def index
    # this is our list page for our reviewss
    @number = rand(100)

    @reviews = ["Baos", "Sarabeth's", "Smac's", "Manhattan Diner"]
  end
end
