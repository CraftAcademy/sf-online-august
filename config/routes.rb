Rails.application.routes.draw do
  get '/restaurant', controller: :restaurant, action: :show
end
