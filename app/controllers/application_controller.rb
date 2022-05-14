# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

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
    redirect_to root_path,  notice: 'YOU ARE NOT ALLOWED.' if check_admin! || check_user!
  end

  def check_admin_manger!
    redirect_to users_path,  notice: 'YOU ARE NOT ALLOWED.' if check_admin! || check_maneger!
  end
end
