Rails.application.routes.draw do

  resources :session, only: [:new, :create, :destroy]
  root "posts#index"
  resources :posts do
    resources :comments
  end
  resources :users, only: [:new, :create]

  get "/picture", to: "posts#picture"

end
