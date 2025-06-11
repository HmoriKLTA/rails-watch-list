Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # Set the root URL ("/") to got to the lists#index action
  root to: 'lists#index'
  # Define the routes for the lists resource
  # Only allow index, show, new, and create actions for lists.
  resources :lists, only: %i[index show new create] do
    # Nested resources for bookmarks and reviews within lists
    # Only allow new and create actions for bookmarks and reviews.
    resources :bookmarks, only: %i[new create destroy]

    # Nest routes: reviews belong to a list
    # Only allow new and create actions for reviews.
    resources :reviews, only: %i[new create]
  end
end

# get '/lists', to: 'lists#index'    lists_path && root_path
# get '/lists/:id', to: 'lists#show' list_path(id)
# get '/lists/new', to: 'lists#new'
# patch '/lists/:id', to: 'lists#update'
# post '/lists', to: "lists#create"
# get '/lists/:id/edit', to: "lists#edit"
# delete '/lists/:id', to: "lists#destroy"

#  list_bookmarks POST   /lists/:list_id/bookmarks(.:format)                                                               bookmarks#create
#  new_list_bookmark GET    /lists/:list_id/bookmarks/new(.:format)

# post '/bookmarks', to: "bookmarks#create"
# delete '/bookmarks/:id', to: "bookmarks#destroy"
# get '/bookmarks/:id/edit', to: "bookmarks#edit"
# patch '/bookmarks/:id', to: "bookmarks#update"
