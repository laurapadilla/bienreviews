# frozen_string_literal: true

# this is my controller for the reviews
class ReviewsController < ApplicationController
  def index
    # this is our list page for reviews
    @reviews = Review.all
  end

  def new
    # form for adding a new review
    @review = Review.new
  end

  def create
    # take info from form and add it to database
    @review = Review.new(params.require(:review).permit(:title, :body, :score))

    # save the reviews
    @review.save

    # redirect back to home page
    redirect_to root_path
  end

  def show
    # individual review page
    @review = Review.find(params[:id])
  end
end
