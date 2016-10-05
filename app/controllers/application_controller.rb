class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions
  protect_from_forgery with: :exception
  before_action :store_current_location, unless: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  def owner_has_restaurant?
    Restaurant.exists?(user: current_user)
  end

  private
  def store_current_location
    store_location_for(:user, request.url)
  end
end
