class EventsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @events = filtrate(@events, 'starts_at asc', pagination: true, pages: 30)
  end

  def show; end

  def new; end

  def edit; end

  def create
    @event.save
    respond_with(@event, location: -> { [:events] })
  end

  def update
    @event.update(event_params)
    respond_with(@event, location: -> { [:events] })
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  # def change_status
  #   @event.toggle!(:locked)
  # end

  def calendar
  end

  private
  def event_params
    params.require(:event).permit(:title, :starts_at, :ends_at, :all_day, :category, :description, :activity_id, :edition_id, :color)
  end
end
