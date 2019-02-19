Rails.application.routes.draw do
  devise_for :users
  root to: "rooftops#index"
  resources :rooftops
  resources :reservations
get '/myrooftops' => 'users#myrooftops', :as => :user_rooftops
end
