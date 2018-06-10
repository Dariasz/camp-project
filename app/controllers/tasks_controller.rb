class TasksController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @tasks = filtrate(@tasks, 'name desc', pagination: true, pages: 30)
  end

  def show; end

  def new; end

  def edit; end

  def create
    @task.save
    respond_with(@task, location: -> { [@task.sequence] })
  end

  def update
    @task.update(task_params)
    respond_with(@task, location: -> { [@task.sequence] })
  end

  def destroy
    @task.destroy
    respond_with(@task)
  end

  private

  def task_params
    params.require(:task).permit(
      :name,
      :sequence_id,
      solutions_attributes: %i[id mark]
    )
  end
end
