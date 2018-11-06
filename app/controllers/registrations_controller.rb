class RegistrationsController <  Devise::RegistrationsController
	prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.
  before_action :configure_permitted_parameters, :only => [:create]


  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me,:username, :name, :country, :sex, :age_group, :race) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :remember_me,:username, :name, :country, :sex, :age_group, :race) }
    end

  private
    def check_captcha
      unless verify_recaptcha
        self.resource = resource_class.new configure_permitted_parameters
        #resource.validate # Look for any other validation errors besides Recaptcha
        respond_with_navigational(resource) { render :new }
      end
  end
end
