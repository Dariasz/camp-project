class User::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params
  PageTitleHelper.formats[:default] = "Maths Beyond Limits"

  def create
    self.resource = warden.authenticate(auth_options)

    if self.resource
      set_flash_message(:notice, :signed_in) if is_flashing_format?
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      flash[:alert] = I18n.t("devise.failure.not_found_in_database", authentication_keys: 'e-mail address')
      redirect_to root_path
    end
  end

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :last_name, :avatar, :age, :nationality, :role, :locale, {avatars: []}])
  end
end
