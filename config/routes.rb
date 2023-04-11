Rails.application.routes.draw do
  devise_for :users

  get 'pages/home'

  resource :setting
  resources :sensors
  resources :api_credentials, only: [:new, :create, :show, :index, :destroy]
  resources :event_conditions
  resources :events do
    resources :event_conditions
  end
  resources :notification_settings

  namespace :api do
      get 'emitters/:token/:mac/:pin/:state', to: 'emitters#update_temp', as: 'update_emitter'
    resources :emitters, param: :mac, only: [:create] do
      put '/:pin', to: 'emitters#update', as: 'emitter_sensor_update'
    end
    resources :sensors, only: [:show, :create, :update] do
      member do
        get :mac
      end
    end
  end

  namespace :admin do
    resources :api_credentials
    resources :sensors
    resources :users
    resources :settings
  end

  mount ActionCable.server => '/cable'

  root "pages#home"
end
