Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root to: 'lists#index'
  resources :lists, only: %i[show new create] do
    resources :bookmarks, only: %i[new create destroy]
  end
end

# get '/lists', to: 'lists#index'
# get '/lists/:id', to: 'lists#show'
# get '/lists/new', to: 'lists#new'
# patch '/lists/:id', to: 'lists#update'
# post '/lists', to: "lists#create"
# get '/lists/:id/edit', to: "lists#edit"
# delete '/lists/:id', to: "lists#destroy"

#  list_bookmarks POST   /lists/:list_id/bookmarks(.:format)                                                               bookmarks#create
#  new_list_bookmark GET    /lists/:list_id/bookmarks/new(.:format)

# post '/bookmarks', to: "bookmarks#create"
# delete '/bookmarks/:id', to: "bookmarks#destroy"

# A user can see all the lists
# GET "lists"

# A user can see the details of a given list and its name
# GET "lists/42"

# A user can create a new list
# GET "lists/new"
# POST "lists"

# A user can add a new bookmark (movie/list pair) to an existing list
# GET "lists/42/bookmarks/new"
# POST "lists/42/bookmarks"

# A user can delete a bookmark from a list. How can we make a delete link again?
# DELETE "bookmarks/25"
