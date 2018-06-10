module ColorsHelper

  def class_for_task(task)
    'error' unless task.solutions.where(mark: nil).count.zero?
  end

  def class_for_activity(activity)
    activity.confirmed? ? 'green' : 'red'
  end

  def class_for_user_and_day(user, day)
    user.feedbacks_per_day(day).zero? ? "negative" : "positive"
  end

  def class_for_user(user)
    'negative' if user.feedbacks.count.zero?
  end

  def class_for_user_grade(grade)
    'positive' if grade != '-'
  end

  def color_for_calendar(event)
    if event.is_property?(current_user)
      'yellow'
    elsif current_user.events.include? (event)
      darken_color(event.color, 0.3)
    else
      event.color
    end
  end

  def darken_color(hex_color, amount)
    hex_color = hex_color.delete('#', '')
    rgb = hex_color.scan(/../).map(&:hex).map { |color| color * amount }.map(&:round)
    '#%02x%02x%02x' % rgb
  end

end
