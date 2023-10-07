Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :purchase_records, only: [:index, :create] do
      resources :delivery_destinations,  only: [:index, :create]
    end
  end

end
