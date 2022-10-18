Rails.application.routes.draw do
  resources :users
  resources :tweets
  resources :likes
  get 'top/main'
  root 'top#main'
  post 'top/login'
  get 'top/logout'
  get 'users/index'
end
