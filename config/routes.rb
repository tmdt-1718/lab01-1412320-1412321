Rails.application.routes.draw do
  root 'users#home'
  get '/', to: 'users#home'
  
  get 'users/home'

  get 'users/albums'

  get 'users/blog'

  get '/about', to: 'static_pages#about'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :images, only: [:show, :index]
end
