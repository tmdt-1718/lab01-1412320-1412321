Rails.application.routes.draw do
  root 'users#home'
  get '/', to: 'users#home'
  
  get 'users/home'

  get 'users/albums'

  get 'users/blog'

  get 'users/about'
end
