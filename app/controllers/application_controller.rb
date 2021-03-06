class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    # before_action :authenticate_user!
    before_action :current_user





  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    if resource.role == 'employee' && resource.sign_in_count == 1
      new_employee_path 
    elsif resource.role == 'employee' && resource.sign_in_count > 1
      employees_path

    elsif resource.role == 'company' && resource.sign_in_count == 1
      new_company_path 
    elsif resource.role == 'company' && resource.sign_in_count > 1
      companies_path
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
