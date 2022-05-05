Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'comments/create'
  get 'comments/destroy'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    member do
      get :followings_user
      get :followers_user
    end
    collection do 
      get 'search'
    end
  end
  resources :posts do 
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    collection do 
      get 'search'
    end
  end 
  resources :relationships, only: [:create, :destroy]
end
