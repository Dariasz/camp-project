class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params
  PageTitleHelper.formats[:default] = "Maths Beyond Limits"

  protected
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar, :age, :role, :nationality, :locale, {avatars: []}])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar, :age, :nationality, :role, :locale, {avatars: []}])
  end
end
