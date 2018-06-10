require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  before_action :authenticate_user!
  before_action :set_locale

  include Filter

  PageTitleHelper.formats[:default] = ":title - Maths Beyond Limits"

  def set_locale
    if current_user.try(:locale).present?
      I18n.locale = current_user.locale
    else
      I18n.locale = I18n.default_locale
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to [:root]
  end
end
