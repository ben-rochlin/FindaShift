class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?





  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  def after_sign_in_path_for(resource)
    if resource.role == 'unassigned'
        edit_user_registration_path
    else 
      test1_show_path 
    end
  end

  # def after_sign_in_path_for(resource)
  #   if resource.role == 'employee'
  #       test1_show_path
  # end

  # def after_sign_in_path_for(resource)
  #   if resource.sign_in_count == 1
  #     edit_user_registration
  #   end
  # end






end
