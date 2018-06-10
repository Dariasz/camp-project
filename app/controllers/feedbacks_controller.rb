class FeedbacksController < ApplicationController
  load_and_authorize_resource

  def index
    @q = @feedbacks.includes(:event).search(params[:q])
    @feedbacks = @q.result.includes(:event).order('event_id asc').page(params[:page]).per(30)
  end

  def received_feedbacks
    @received_feedbacks = @feedbacks.includes(:event).order('event_id asc').map{|f| f if f.event.is_property?(current_user)}.compact
  end

  def my_feedbacks
    @my_feedbacks = @feedbacks.where(user_id: current_user.id).order('event_id asc').page(params[:page]).per(20)
  end

  def bad_feedbacks
    @bad_feedbacks = @feedbacks.where("mark < ?", 3).order('event_id asc')
  end

  def show; end

  def new; end

  def edit; end

  def create
    @feedback.save
    respond_with(@feedback, location: -> { [:my_feedbacks, :feedbacks] })
  end

  def update
    @feedback.update(feedback_params)
    respond_with(@feedback, location: -> { [:my_feedbacks, :feedbacks] })
  end

  def destroy
    @feedback.destroy
    respond_with(@feedback, location: -> { [:my_feedbacks, :feedbacks] })
  end

  private

  def feedback_params
    params.require(:feedback).permit(
      :user_id,
      :event_id,
      :event,
      :mark,
      :comment
    )
  end
end
