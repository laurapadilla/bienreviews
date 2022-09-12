# frozen_string_literal: true

# this is my controller for the comments

class CommentsController < ApplicationController
  def create
    # find the review
    @review = Review.find(params[:review_id])

    @comment = @review.comments.new(params.require(:comment).permit(:body))

    @comment.save

    # go back to the review
    redirect_to review_path(@review)
  end
end
