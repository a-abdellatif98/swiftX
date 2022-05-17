# frozen_string_literal: true

class ApplicationController < ActionController::Base
  respond_to :json

  before_action :underscore_params!
  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: %i[email password password_confirmation admin user_maneger]
    )
  end

  def check_admin!
    current_user.admin?
  end

  def check_maneger!
    current_user.user_maneger?
  end

  def check_user!
    current_user.user_maneger? && current_user.admin?
  end

  def check_user_or_admin!
    if check_admin! || check_user!
      redirect_to root_path, notice: 'YOU ARE NOT ALLOWED.'
    end
  end

  def check_admin_manger!
    if check_admin! || check_maneger!
      redirect_to users_path, notice: 'YOU ARE NOT ALLOWED.'
    end
  end

  def authenticate_user
    if request.headers['Authorization'].present?
      authenticate_or_request_with_http_token do |token|
        jwt_payload =
          JWT.decode(token, Rails.application.secrets.secret_key_base).first

        @current_user_id = jwt_payload['id']
      rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
        head :unauthorized
      end
    end
  end

  def authenticate_user!(_options = {})
    head :unauthorized unless signed_in?
  end

  # def current_user
  #   @current_user ||= super || User.find(@current_user_id)
  # end

  def signed_in?
    @current_user_id.present?
  end
end
