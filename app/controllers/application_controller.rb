class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?





  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  def after_sign_in_path_for(resource)
    if resource.role == 'employee' && resource.sign_in_count == 1
      new_employee_path 
    elsif resource.role == 'employee' && resource.sign_in_count > 1
      employee_path

    elsif resource.role == 'company' && resource.sign_in_count == 1
      test1_show_path 
    elsif resource.role == 'company' && resource.sign_in_count > 1
      test2_show_path
    else 
     root_path   
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
