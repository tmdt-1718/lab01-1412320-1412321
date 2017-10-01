Rails.application.routes.draw do
  root 'users#home'

  get '/about', to: 'static_pages#about'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :images, only: [ :show, :index ]
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
