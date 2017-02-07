class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :charts_song

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: User::ATTRIBUTES_PARAMS
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    redirect_to root_path
  end
  
  rescue_from ActiveRecord::RecordNotFound do
    flash[:danger] = t "controllers.application.flash_error"
    redirect_to admin_users_path
  end

  def charts_song
    @songs = Song.order(views: :desc).limit 5
  end
end
