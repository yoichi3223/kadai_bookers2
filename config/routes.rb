Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  root 'home#top'
  get 'home/about'
  get 'users/follower_users'
  devise_for :users
  resources :relationships, only: [:create, :destroy]
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resources :book_comments,only: [:create, :destroy]
  end
end