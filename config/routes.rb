Rails.application.routes.draw do

  resources :cart_items

  resources :carts

  resources :sale_items

  resources :categories

  resources :products, only: [:index]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products

  root :to => "home#index"
end
