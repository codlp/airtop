Rails.application.routes.draw do
  devise_for :users
  root to: "rooftops#index"
  resources :rooftops do
    resources :reservations, only: [:new, :create]
  end
  resources :reservations, only: [:show]
get '/myrooftops' => 'users#myrooftops', :as => :user_rooftops
get '/myreservations' => 'users#myreservations', :as => :user_reservations

end
