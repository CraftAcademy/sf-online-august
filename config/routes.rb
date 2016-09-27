Rails.application.routes.draw do
  get '/restaurant', controller: :restaurant, action: :index

  resources :dishes

end
