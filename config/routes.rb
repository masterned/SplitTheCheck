Rails.application.routes.draw do
  devise_for :users
  
  root to: 'restaurants#index'
  
  resources :restaurants, only: [:index, :show, :new, :create, :edit, :update]
  resources :votes, only: [:create]
  resources :comments, only: [:new, :create]
  resources :favorites, only: [:create]
  
  resource :user

  get '/search', to: 'restaurants#search', as: 'search'
  delete '/favorites', to: 'favorites#destroy', as: 'unfavorite'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
