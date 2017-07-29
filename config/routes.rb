Rails.application.routes.draw do
  resources :talks
  resources :reset_password, only: :create
  jsonapi_resources :users, only: :create
end
