module HasColor
  COLORS =  {
    'Sport': '#3cd6f2',
    'Mathematical Class': '#4db770',
    'Camper Talk': '#5dea8c',
    'Evening activity': '#a35dea',
    'Meal': '#eab65d',
    'Meeting': '#8e8b84',
    'Special': '#ea5d5d',
    'Other': '#9e9bc6'
  }

  def set_color
    if self.activity.present?
      self.color = my_color(self.activity.category)
    else
      self.color = my_color(self.category)
    end
  end

  def my_color(key)
    COLORS[key.to_sym]
  end
end
