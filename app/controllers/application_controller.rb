class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
 before_action :authenticate_user!, only: [:show,:edit]



  protected
  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :introduction, :profile_image, :beginner_thing, :beginner_period, :beginner_level, :expert_thing, :expert_period, :expert_level])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name ])
  end


end


