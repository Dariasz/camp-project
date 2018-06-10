module SequencesHelper

  def sequence_stats_for_user(sequence, user)
    solutions = sequence.solutions.where(author: user).order('task_id asc') || []
    tasks = sequence.tasks

    tasks.map do |task|
      OpenStruct.new(
        OpenStruct.new(
          grade: (solutions.where(task_id: task.id).first.try(:mark) || '-')
        )
      )
    end
  end

  def sequence_sum_for_user(sequence, user)
    sequence.solutions.where(author: user).sum{ |e| e.mark.to_f }
  end

end
