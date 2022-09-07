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
    # take info from form and add it to model
    @review = Review.new(form_params)

    # check if the model can be saved
    # if it can be saved, go to homepage
    # but if it isnt', then show the new review forms
    if @review.save
      redirect_to root_path
    else
      # show the new.html.erb file
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    # show the individual review page
    @review = Review.find(params[:id])
  end

  # delete the review
  def destroy
    # find the individual review
    @review = Review.find(params[:id])

    # delete/destroy review
    @review.destroy

    # redirect back to homepage
    redirect_to root_path, status: :see_other
  end

  def edit
    # find the individual review to edit
    @review = Review.find(params[:id])
  end

  def update
    # find the individual review to update
    @review = Review.find(params[:id])

    # update with the new info from form
    if @review.update(form_params)
      # redirect back to review
      redirect_to review_path, status: :see_other
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def form_params
    params.require(:review).permit(:title, :body, :score, :restaurant, :ambiance)
  end
end
