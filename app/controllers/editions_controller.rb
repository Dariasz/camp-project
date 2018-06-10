class EditionsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @editions = filtrate(@editions, 'edition_start desc', pagination: true, pages: 5)
  end

  def show; end

  def new; end

  def edit; end

  def create
    @edition.save
    respond_with(@edition)
  end

  def update
    @edition.update(edition_params)
    respond_with(@edition)
  end

  def destroy
    @edition.destroy
    respond_with(@edition)
  end

  def apply_for
    @edition.user_editions.create(user: current_user, role: 'applicant')
    unless current_user.admin? || current_user.organizer?
      current_user.applicant!
    end
    redirect_to @edition
  end

  private

  def edition_params
    params.require(:edition).permit(
      :name,
      :edition_start,
      :edition_end,
      :recruitment_deadline,
      :camp_start,
      :camp_end,
      :camp_place,
      user_editions_attributes: %i[id role]
    )
  end
end
