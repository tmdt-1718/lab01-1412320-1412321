Rails.application.routes.draw do
  root 'users#home'

  get 'users/blog'

  get '/about', to: 'static_pages#about'

  devise_for :users do
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :images, only: [ :show, :index ]
  resources :users, only: [ :member ] do
    resources :albums, only: [ :index, :show, :member ] do
      resources :images, only: [ :create ]
    end
  end
end
