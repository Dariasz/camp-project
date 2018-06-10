module SelectHelper

  def categories_for_activities
    if current_user.camper?
      ["Camper Talk", "Evening activity", "Sport"]
    elsif current_user.tutor? || current_user.semitutor?
      ["Mathematical Class", "Evening activity", "Sport"]
    elsif current_user.organizer? || current_user.admin?
      ["Mathematical Class", "Evening activity", "Camper Talk", "Special", "Sport"]
    else
    end
  end

  def tasks_for_solution(user, time)
    opened_tasks = Task.select { |task| task.sequence.opened_at? time }
    opened_tasks.reject { |task| task.has_user? user }
  end

  def task_for_form
    @solution.task.nil? ? Task.find_by_id(params[:task]) : @solution.task
  end

end
