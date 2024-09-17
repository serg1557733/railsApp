Rails.application.routes.draw do
  root "posts#index"
  resources :posts do
    resources :comments
  end

  get "/picture", to: "posts#picture"
end
