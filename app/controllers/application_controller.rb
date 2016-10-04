class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions
  protect_from_forgery with: :exception
  before_action :store_current_location, unless: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    if exception.message == "Couldn't find Restaurant with 'id'=#{params[:id]}"
      flash[:alert] = 'Restaurant not found'
      redirect_to request.referer ? :back : root_url
    elsif exception.message == "Couldn't find Dish with 'id'=#{params[:id]}"
      flash[:alert] = 'Dish not found'
      redirect_to request.referer ? :back : root_url
    elsif exception.message == "Couldn't find Menu with 'id'=#{params[:id]}"
      flash[:alert] = 'Menu not found'
      redirect_to request.referer ? :back : root_url
    else
      raise StandardError, exception.message, exception.backtrace
    end
  end

  private
  def store_current_location
    store_location_for(:user, request.url)
  end
end
