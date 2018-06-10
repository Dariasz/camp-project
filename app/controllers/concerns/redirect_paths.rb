module RedirectPaths

  def update_solution_path(solution, user)
    if can? :create, Task
      solution.task
    else
      solution.author == user ? %i[my_solutions solutions] : :solutions
    end  
  end

end
