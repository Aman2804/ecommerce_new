class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource) 
    if current_user.user_type?
      root_path
    else
      admin_dashboards_path
    end
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:dob,:phone,:email,:password,:password_confirmation,:user_type])
  end
end
