Rails.application.routes.draw do
  resources :talks
  post "/reset_password", controller: :reset_password, action: :create
end
