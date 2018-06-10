module ActivitiesHelper

  def boolean_status_activity(object)
    if object.confirmed?
      content_tag(:div, '', class: ' ui two buttons margin-bottom-10') do
        content_tag(:div, '', class: ' ui basic button green small change_status disabled', 'data-url' => change_status_activity_path(object)) do
          content_tag(:i, '', class: 'icon checkmark') + t('activities.activity_card.confirm')
        end +
            content_tag(:div, '', class: ' ui basic button red small change_status', 'data-url' => change_status_activity_path(object)) do
              content_tag(:i, '', class: 'icon remove') + t('activities.activity_card.unconfirm')
            end
      end
    else
      content_tag(:div, '', class: ' ui two buttons margin-bottom-10') do
        content_tag(:div, '', class: ' ui basic button green small change_status', 'data-url' => change_status_activity_path(object)) do
          content_tag(:i, '', class: 'icon checkmark') + t('activities.activity_card.confirm')
        end +
            content_tag(:div, '', class: ' ui basic button red small change_status disabled', 'data-url' => change_status_activity_path(object)) do
              content_tag(:i, '', class: 'icon remove') + t('activities.activity_card.unconfirm')
            end
      end
    end
  end

  def variable_status(object)
    if object.confirmed?
      content_tag(:div, '', class: 'ui label right ribbon green') do
        content_tag(:i, '', class: 'icon checkmark') + t('activities.activity_card.confirmed')
      end
    else
      content_tag(:div, '', class: ' ui label right ribbon red') do
        content_tag(:i, '', class: 'icon remove') + t('activities.activity_card.unconfirmed')
      end
    end
  end

  def variable_columns
    %i[group level days]
  end

  def users_collection_without_author(author)
    collection = {}

    User.all.each do |user|
      collection = collection.merge(user.name => user.id) if user.id != author.id
    end

    collection
  end
end
