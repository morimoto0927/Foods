Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'pages#home'
  get 'comments/create'
  get 'comments/destroy'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  resources :users do
    member do
      get :followings_user
      get :followers_user
      get :favorites
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
