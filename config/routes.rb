Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions:       'users/sessions',
    registrations:  'users/registrations'
  }
  resources :rooms, :only => [:create]
  resources :chats, :only => [:create, :show, :index]
  resources :users,only: [:show,:index,:edit,:update] do
  get 'followers' => 'relationships#followers'
  get 'follows' => 'relationships#follows'
  end
  resources :relationships, only: [:create, :destroy]
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resources :book_comments, only: [:create, :destroy]
  end
  root 'home#top'
  get 'home/about'
  get 'search' => 'search#search'
end