Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'welcome#index'

  resources :tenants, except: [:show]
  resources :receipts, except: [:delete, :edit, :update, :show]
end
