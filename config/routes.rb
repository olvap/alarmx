Rails.application.routes.draw do
  namespace :admin do
    resources :buildings
    resources :emitters
    resources :sensors
    resources :users
    resources :settings
  end
  get 'pages/home'
  devise_for :users
  resources :emitters, only: [:index]
  resources :buildings do
    collection do
      get :favorite
    end
    resources :emitters
  end
  resource :setting
  resources :sensors
  resources :api_credentials, only: [:new, :create, :show, :index, :destroy]

  namespace :api do
    resources :emitters, param: :token, only: [:create] do
      put '/:pin', to: 'emitters#sensor_update', as: 'emitter_sensor_update'
    end
    resources :sensors, only: [:show, :create, :update] do
      member do
        get :mac
      end
    end
    resources :buildings, only: [:show, :index]
  end

  mount ActionCable.server => '/cable'

  root "pages#home"
end
