Rails.application.routes.draw do
  devise_for :users
  
  root to: 'restaurants#index'
  
  resources :restaurants, only: [:index, :show, :new, :create, :edit, :update]
  resources :users, only: [:show]
  resources :votes, only: [:create]
  resources :comments, only: [:new, :create]
  resources :favorites, only: [:create]

  get '/search', to: 'restaurants#search', as: 'search'
  delete '/favorites', to: 'favorites#destroy', as: 'destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
