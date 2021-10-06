Rails.application.routes.draw do
  root to: "homescreens#show"
  resource :homescreen, only: :show

  resources :users
  resources :posts

  namespace :lazy_load do
    resources :posts, only: [:index, :show]
    resources :users, only: [:index,:show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
