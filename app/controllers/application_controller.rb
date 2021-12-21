class ApplicationController < ActionController::Base
  before_action :strong, if: :devise_controller?
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def strong
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[nickname email encrypted_password password_confirmation])
  end
end
