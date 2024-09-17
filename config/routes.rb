Rails.application.routes.draw do
  root "posts#index"
  resources :posts

  get "/picture", to: "posts#picture"
end
