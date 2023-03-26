Rails.application.routes.draw do
  namespace :api do
    resources :sensors, only: [:show, :update]
  end

  resources :rooms, only: [:index, :show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Add in our Websocket route
  mount ActionCable.server => '/cable'

  # Defines the root path route ("/")
  root "rooms#index"
end
