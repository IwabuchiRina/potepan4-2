Rails.application.routes.draw do
  root to: 'home#top'
  devise_for :users
  get '/rooms/posts', 'rooms#posts'
  resources :rooms
  get '/users/account', 'users#account'
  resources :reservations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
