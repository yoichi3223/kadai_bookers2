Rails.application.routes.draw do
  get "search" => "searchs#search"
  get 'favorites/create'
  get 'favorites/destroy'
  root 'home#top'
  get 'home/about'
  devise_for :users
  resources :relationships
  resources :users,only: [:show,:index,:edit,:update] do
    member do
      get 'follows'
      get 'followed'
    end
  end
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resources :book_comments,only: [:create, :destroy]
  end
end