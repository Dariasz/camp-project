class ActivityAttachmentsController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show; end

  def new; end

  def edit; end

  def create
    @activity_attachment.save
    respond_with(@activity_attachment, location: -> { [@activity_attachment.activity] })
  end

  def update
    @activity_attachment.update(activity_params)
    respond_with(@activity_attachment, location: -> { [@activity_attachment.activity] })
  end

  def destroy
    @activity_attachment.destroy
    respond_with(@activity_attachment, location: -> { [@activity_attachment.activity] })
  end

  private

  def activity_attachment_params
    params.require(:activity_attachment).permit(
      :id,
      :handout,
      :activity_id
    )
  end
end
