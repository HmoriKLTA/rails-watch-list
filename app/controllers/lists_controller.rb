class ListsController < ApplicationController
  def index
    @lists = List.all # Fetching all records from the List model and storing them in an instance variable
  end

  def show
    @list = List.find(params[:id]) # Retrieving a specific record from the List model using its ID parameter
    @list.bookmarks.new # Accessing associated bookmarks for the @list object
    @movies = Movie.all # Retrieving all records from the Movie model and storing them in an instance variable
    @bookmark = Bookmark.new # Creating a new instance of the Bookmark model without saving it to the database
    @review = @list.reviews.new # Creating a new instance of the Review model associated with the @list object.
  end

  # Defines a method called 'new' to initialize a new List object
  def new
    @list = List.new # Creates a new instance of the List model
    @movies = Movie.all
  end

  # Defines a method called 'create' to handle form submissions and save a new List object
  def create
    # Initializes a new List object with provided parameters
    @list = List.new(list_params)

    # Attempts to save the new List object to the database
    if @list.save
      # Redirects to the newly created list's page with a success message
      redirect_to lists_path(@list)
    else
      @movies = Movie.all
      # Re-renders the 'new' form with an error status if validation fails
      render 'lists/show', status: :unprocessable_entity
    end
  end

  # Declares a private method to sanitize and permit specific parameters for the List model
  private

  # Defines a strong parameters method for List
  def list_params
    # Ensures that the request includes a :list parameter and only permits the :name attribute
    params.require(:list).permit(:name, :photo)
  end
end
