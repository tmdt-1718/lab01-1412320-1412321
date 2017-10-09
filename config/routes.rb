Rails.application.routes.draw do
  root 'users#home'

  get '/about', to: 'static_pages#about'
  resources :blogs, only: [ :new, :create, :edit, :update, :destroy ]
    get 'blogs', to: 'blogs#all'
  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    omniauth_callbacks: 'auth/callbacks'
  }

  resources :images, only: [ :show, :index, :destroy ]
  resources :albums, only: [ :new, :create, :destroy ]
    get 'albums', to: 'albums#all'
  resources :users, only: [ :member ] do
    get 'home'
    resources :blogs, only: [ :index, :show ] do
      resources :comments, only: [:create]
    end
    
    resources :albums, only: [ :index, :show, :member, :cover ] do
      member do
        post 'cover'
      end
      resources :images, only: [ :create ]
    end
  end
end
