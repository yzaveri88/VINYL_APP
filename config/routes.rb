Rails.application.routes.draw do
  resources :bookings, only: :show
  devise_for :users
  resources :records do
    resources :bookings, only: [:new, :create, :edit, :update, :destroy]
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
