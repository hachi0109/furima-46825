Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items
  resources :users
  resources :orders, only: :index
end
