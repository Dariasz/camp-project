module ActivityFeedback

  def feedbacks_of_activity_for_user(activity, user)
    feedbacks = []
    if activity.user == user || activity.assistant_ids.include?(user.id) || user.admin? || user.organizer?
      events = activity.events
      events.each do |event|
        event.feedbacks.each do |f|
          feedbacks.push(f)
        end
      end
    end
    feedbacks
  end
  
end
