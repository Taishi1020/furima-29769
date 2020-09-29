class ApplicationController < ActionController::Base
<<<<<<< HEAD

 before_action :configure_permitted_parameters, if: :devise_controller?

 protected
 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday, :name_kana, :name_full_width_character, :nickname,:email])
 end

  before_action :basic_auth

  
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

=======
>>>>>>> parent of 8a9dbe5... Merge pull request #2 from Taishi1020/product
end

