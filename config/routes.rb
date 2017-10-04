Rails.application.routes.draw do
  root 'users#home'

  get '/about', to: 'static_pages#about'
  resources :blogs, only: [ :new, :create, :edit, :update, :destroy ]

  devise_for :users
  
  resources :images, only: [ :show, :index, :destroy ]
  resources :albums, only: [ :new, :create, :destroy ]
  resources :users, only: [ :member ] do
    resources :blogs, only: [ :index, :show ]
    resources :albums, only: [ :index, :show, :member, :cover ] do
      member do
        post 'cover'
      end
      resources :images, only: [ :create ]
    end
  end
end