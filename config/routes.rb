Rails.application.routes.draw do
  get 'session/new'
  get 'session/create'
  resources :sessions, only: [:new, :create]
  root "posts#index"
  resources :posts do
    resources :comments
  end
  resources :users, only: [:new, :create]

  get "/picture", to: "posts#picture"

end
