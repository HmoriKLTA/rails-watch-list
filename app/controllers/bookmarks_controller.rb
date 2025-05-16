class BookmarksController < ApplicationController
  # Controller action for initializing a new Bookmark instance
  def new
    @bookmark = Bookmark.new # Creates a new Bookmark instance
    # Retrieves a List instance from the database using the list_id parameter passed in the request.
  end

  # Controller action for creating a new Bookmark and associating it with a List
  def create
    # Initializes a new Bookmark instance using permitted parameters
    @bookmark = Bookmark.new(bookmark_params)
    # Retrieves a List instance from the database using the list_id parameter passed in the request.
    @list = List.find(params[:list_id])
    # Finds the corresponding List based on the ID parameter
    @bookmark.list = @list
    # Attempts to save the Bookmark to the database

    if @bookmark.save
      # Redirects to the form for creating another bookmark
      redirect_to list_path(@list), notice: 'Bookmark was successfully created.'
    else
      # Re-renders the 'lists/show' form with an error status if validation fails
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
  end

  private

  # Private method to enforce strong parameters for the Bookmark model
  def bookmark_params
    # Ensures that the request includes a :bookmark parameter and only permits :comment and :list_id attributes
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
