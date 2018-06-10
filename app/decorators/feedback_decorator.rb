class FeedbackDecorator < Draper::Decorator
  delegate_all

  def comment
    object.comment.truncate(20) if object.comment.present?
  end

end
