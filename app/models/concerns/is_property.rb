module IsProperty
  def is_property?(user)
    self.activity.present? && (
      self.activity.user.id == user.id ||
      self.activity.assistant_ids.include?(user.id)
    )
  end
end
