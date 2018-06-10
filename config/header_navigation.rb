SimpleNavigation::Configuration.run do |navigation|
  navigation.autogenerate_item_ids = false
  navigation.auto_highlight = true

  def label(text, icon)
    [
      label_icon(icon),
      label_text(text)
    ].join.html_safe
  end

  def label_text(text)
    text = ' ' + I18n.t(".sidebar.#{text}")
    content_tag(:span, text)
  end

  def label_icon(icon)
    fa_icon(icon)
  end

  navigation.items do |primary|
    primary.dom_class = 'header nav-header item'
  end
end
