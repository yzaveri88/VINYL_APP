Rails.application.routes.draw do
  get 'records/index'
  get 'records/show'
  get 'records/new'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
