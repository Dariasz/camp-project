class LayoutsController < ApplicationController

  def language_select
    current_user.update_attributes(locale: params[:locale].downcase)
  end
end