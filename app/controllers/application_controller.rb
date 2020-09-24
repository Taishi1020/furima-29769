class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?

 protected
 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday, :name_kana, :name_full_width_character, :nickname,:email])
 end
end
