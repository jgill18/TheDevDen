Rails.application.routes.draw do
  # Admin authentication routes
  get 'admin_login', to: 'admin_sessions#new', as: 'admin_login'
  post 'admin_login', to: 'admin_sessions#create'
  delete 'admin_logout', to: 'admin_sessions#destroy', as: 'admin_logout'

  # User authentication routes
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  get 'signup', to: 'users#new', as: 'signup'
  post 'users', to: 'users#create'

  # Home page route
  root 'home#index'

  # Product routes
  resources :products, only: [:index, :show]

  # Account routes
  resource :account, only: [:show]

  # About page routes
  resource :about, only: [:show, :edit, :update], controller: 'about'

  # Contact page routes
  resource :contact, only: [:show, :edit, :update], controller: 'contact'

  # Cart_items page routes
  get '/cart', to: 'cart_items#index'

# config/routes.rb
  resources :cart_items, only: [:create, :index, :destroy]  # Add :destroy here


  # Admin namespace routes
  namespace :admin do
    resources :products
    get 'dashboard', to: 'dashboard#index'
    get 'about/edit', to: 'about#edit', as: 'edit_about'
    put 'about', to: 'about#update'

    # Contact page routes within admin namespace
    get 'contact/edit', to: 'contact#edit', as: 'edit_contact'
    put 'contact', to: 'contact#update'
  end

  # Add any additional routes here
end
