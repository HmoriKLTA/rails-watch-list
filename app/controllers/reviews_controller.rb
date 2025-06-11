class ReviewsController < ApplicationController
  # before running new or create actions, find the list by its ID.
  before_action :set_list, only: %i[new create]

  # GET /lists/:list_id/reviews/new
  # This action is used to display the form for creating a new review.
  def new
    # Initialize a new review associated with the list
    @review = @list.reviews.new
  end

  # POST /lists/:list_id/reviews
  # This action is used to create a new review.
  def create
    # Builds a new review for the list using the provided review parameters
    @review = @list.reviews.new(review_params)
    if @review.save
      # if the review is saved successfully, redirect to the list's show page
      redirect_to list_path(@list)
    else
      # if the review fails to save, initialize a new bookmark and render the list's show page with an error status
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Only allow content rating fields to be submitted from the form
  def review_params
    params.require(:review).permit(:content, :rating)
  end

  # Finds a review by its ID
  def set_review
    @review = Review.find(params[:id])
  end

  # Finds a list by its ID from the URL parameters
  def set_list
    @list = List.find(params[:list_id])
  end
end
