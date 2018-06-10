class SolutionsController < ApplicationController
  include RedirectPaths
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :validate_task, only: :new

  def index
    @solutions = filtrate(@solutions, 'created_at desc', pagination: true, pages: 30)
  end

  def new; end

  def edit; end

  def create
    if @solution.save
      respond_with @solution, location: -> { %i[my_solutions solutions] }
    else
      redirect_to :editions, alert: t('already_exists.solution')
    end
  end

  def update
    @solution.update(solution_params)
    respond_with @solution, location: -> { update_solution_path(@solution, current_user) }
  end

  def destroy
    @solution.destroy
    respond_with(@solution)
  end

  def my_solutions
    index
    @my_solutions = @solutions.select{ |sol| sol.author == current_user }
  end

  private

  def solution_params
    params.require(:solution).permit(:author_id, :task_id, :answer, :mark)
  end

  def validate_task
    redirect_to(:editions, flash: { alert: t('not_found.task') }) unless Task.find_by_id(params[:task])
  end
end
