# TODO: Below are three questions for you to answer. Read each of the questions
# and make sure each of the methods `return` the correct answer.
# ⚠️ Try and answer them before running `rake`.
def plants_resources_routes
  # TODO: Return a `Array` the 7 `actions` that `resources :restaurants` would generate for you.
  routes = ["get '/restaurants', to: 'restaurants#index'",
            "post '/restaurants', to: 'restaurants#create'",
            "get '/restaurants/new', to: 'restaurants#new'",
            "get '/restaurants/:id/edit', to: 'restaurants#edit'",
            "get '/restaurants/:id', to: 'restaurants#show'",
            "patch '/restaurants/:id', to: 'restaurants#update'",
            "delete '/restaurants/:id', to: 'restaurants#destroy'"]
  return routes
end

def nested_routes_for_n_to_n?
  # TODO: Return a `true` or `false` to answer this question:
  # If you have a many to many relationship between you models like `Restaurant` and `Review` (belongs_to :restaurant),
  # do you always have to nest all your routes for `Review` in `Restaurant`?
  return false
end

def validate_name
  # TODO: Return a `string` of the ActiveRecord validation need to make sure no record is
  # created without a name. /!\ in Rails' context, a validation **is not** a String!
  # (it is only a String for the purpose of this exercise)
  "validates :name, presence: true"
end
