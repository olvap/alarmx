Rails.application.routes.draw do
  devise_for :users
  resources :buildings
  resources :sensors
  resources :api_credentials, only: [:new, :create, :show, :index, :destroy]

  namespace :api do
    resources :sensors, only: [:show, :create, :update]
    resources :buildings, only: [:show, :index]
  end

  resources :rooms, only: [:index, :show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Add in our Websocket route
  mount ActionCable.server => '/cable'

  # Defines the root path route ("/")
  root "rooms#index"
end
