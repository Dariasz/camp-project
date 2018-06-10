module FeedbacksHelper
  def event_collection_for_feedback
    collection = {}
    Event.all.each do |event|
      collection = collection.merge(event.title => event.id) unless event.users.include?(current_user) || event.locked || event.is_property?(current_user)
    end
    collection
  end
end
