Rails.application.routes.draw do
  root 'restaurants#index'

  resources :restaurants, only: [:index, :show, :new, :create, :edit, :update]

  get '/search', to: 'restaurants#search', as: 'search'

  post '/vote_will_split/:id', to: 'restaurants#vote_will_split', as: :vote_will_split

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
