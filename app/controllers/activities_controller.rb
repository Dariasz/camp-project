class ActivitiesController < ApplicationController
  load_and_authorize_resource
  include ActivityFeedback
  respond_to :html

  def index
    @activities = filtrate(@activities, 'title asc', pagination: true, pages: 20)
  end

  def show
    @activity_attachment = ActivityAttachment.new
    @feedbacks = feedbacks_of_activity_for_user(@activity, current_user)
    @average_mark = @feedbacks.count.zero? ? 0 : @feedbacks.map(&:mark).sum / @feedbacks.count.to_f
  end

  def new
    @activity.activity_attachments.build
  end

  def edit; end

  def create
    @activity.author_id = current_user.id
    @activity.save
    respond_with(@activity, location: -> { [:my_activities, :activities] })
  end

  def update
    @activity.update(activity_params)
    respond_with(@activity, location: -> { [:my_activities, :activities] })
  end

  def destroy
    @activity.destroy
    respond_with(@activity, location: -> { [:my_activities, :activities] }) ## ahould be different and TODO if organiser, we would like :back here
  end

  def change_status
    @activity.toggle!(:confirmed)
    @activity.confirmed? ? @activity.update(acceptance: current_user) : @activity.update(acceptance_id: '')
  end

  def my_activities
    index
    @my_activities = @activities.map do |activity|
      activity if (activity.author_id == current_user.id || activity.assistant_ids.include?(current_user.id))
    end.compact
  end

  private

  def activity_params
    params.require(:activity).permit(
      :title,
      :description,
      :author_id,
      :group,
      :category,
      :level,
      :days,
      :confirmed,
      :acceptance_id,
      activity_attachments_attributes: [
        :id,
        :handout,
        :activity_id
      ]
    )
  end
end
