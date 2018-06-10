module EventsHelper
  def categories_for_events
    %w[Meal Meeting Other]
  end

  def confirmed_activities
    Activity.confirmed.order(:title)
  end

  def boolean_status(object)
    unless object.locked?
      content_tag(:div, '', class: ' ui two buttons margin-bottom-10') do
        content_tag(:div, '', class: ' ui basic button green small change_status disabled', 'data-url' => change_status_event_path(object)) do
          content_tag(:i, '', class: 'icon checkmark') + t('events.event_card.unlock')
        end +
          content_tag(:div, '', class: ' ui basic button red small change_status', 'data-url' => change_status_event_path(object)) do
            content_tag(:i, '', class: 'icon remove') + t('events.event_card.lock')
          end
      end
    else
      content_tag(:div, '', class: ' ui two buttons margin-bottom-10') do
        content_tag(:div, '', class: ' ui basic button green small change_status', 'data-url' => change_status_event_path(object)) do
          content_tag(:i, '', class: 'icon checkmark') + t('events.event_card.unlock')
        end +
          content_tag(:div, '', class: ' ui basic button red small change_status disabled', 'data-url' => change_status_event_path(object)) do
            content_tag(:i, '', class: 'icon remove') + t('events.event_card.lock')
          end
      end
    end
  end

end
