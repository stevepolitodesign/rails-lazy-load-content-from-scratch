Rails.application.routes.draw do
  resources :users
  resources :posts

  namespace :lazy_load do
    defaults format: :json do
      resources :posts, only: [:index, :show]
      resources :users, only: [:index,:show]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
