Rails.application.routes.draw do
  get '/restaurant', controller: :restaurant, action: :index

  resources :dishes

  get '/menu', controller: :menu, action: :index

end
