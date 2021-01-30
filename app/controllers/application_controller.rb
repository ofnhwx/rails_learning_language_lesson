class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  private

  def after_sign_out_path_for(resource)
    case resource
    when :admin
      new_admin_session_path
    when :teacher
      new_teacher_session_path
    else # :user
      new_user_session_path
    end
  end

  def configure_permitted_parameters
    added_attributes = %i[name]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attributes)
  end
end
