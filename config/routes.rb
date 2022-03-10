Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    member do
      get :followings_user
      get :followers_user
    end
  end
  resources :posts
  resources :relationships, only: [:create, :destroy]
end
