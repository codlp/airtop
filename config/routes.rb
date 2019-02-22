Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
  root to: "rooftops#index"
  resources :users, only: [:show, :edit, :update]
  resources :rooftops do
    resources :reservations, only: [:new, :create]
  end
  resources :reservations, only: [:show] do
    member do
      get :decline
      get :accept
    end
  end
  resources :reservations do
    resources :messages, only: [ :new, :create, :index, :destroy ]
  end
  get '/myrooftops' => 'users#myrooftops', :as => :user_rooftops
  get '/myreservations' => 'users#myreservations', :as => :user_reservations
  get '/rooftops_reservations' => 'users#rooftops_reservations', :as => :rooftops_reservations
end
