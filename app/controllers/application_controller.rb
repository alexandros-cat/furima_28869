class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :authenticate_user!

  before_action :configure_permitted_parameters,
                if: :devise_controller?

  protected

  protect_from_forgery with: :exception
  # rescue_from ActiveRecord::RecordNotFound, with: :rescue404

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :nickname, :encrypted_password, :birthday])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
