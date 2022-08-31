class ReviewsController < ApplicationController
  def index
    # this is our list page for our reviewss
    @number = rand(100)

    @reviews = ["Baos", "The Smile", "Chipotle", "Manhattan Diner"]
  end
end
