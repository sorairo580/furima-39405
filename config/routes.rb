Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :purchase_record, only: :create
  end

  resources :purchase_record, only: :create do
      resources :delivery_destination, only: :create
  end
end
