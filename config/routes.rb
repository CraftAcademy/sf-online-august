Rails.application.routes.draw do

  get '/restaurant', controller: :restaurants, action: :index
  get '/carts', controller: :carts, action: :index
  get '/order', controller: :order, action: :index

  resources :dishes, only: [:new, :show, :create] do
    post 'add_item', controller: :carts, action: :add_item
  end

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :menus, only: [:index, :create, :new, :show]

  resources :order, only: [:index, :create, :new, :show]

  root to: 'restaurant#index'
end
