Rails.application.routes.draw do
  devise_for :users

  resources :tenants, except: [:show]
  resources :receipts, except: [:delete, :edit, :update, :show]
end
