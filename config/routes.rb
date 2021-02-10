Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :tenants, except: [:show]
  resources :receipts, except: [:delete, :edit, :update, :show]
end
