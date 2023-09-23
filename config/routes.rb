Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  post 'items', to: 'items#create'
end
