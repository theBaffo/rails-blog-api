Rails.application.routes.draw do
  # /users endpoints
  api_guard_routes for: 'users'

  resources :articles do
    resources :comments
  end
end
