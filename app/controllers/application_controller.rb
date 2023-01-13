class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActionController::InvalidAuthenticityToken, :with => :bad_token
  def bad_token
    flash[:warning] = "Session expired"
    redirect_to root_path
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
  rescue_from CanCan::AccessDenied do
    flash[:notice] = 'No tienes permiso para acceder a esta sección'
    redirect_to root_url
  end
end
