module ApplicationHelper
  include IsProperty

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def received_feedbacks_count
    Feedback.all.map do |f|
      if f.event.present?
        f if f.event.is_property?(current_user)
      end
    end.compact.count
  end

  def last_logged(user)
    if user.last_sign_in_at.blank?
      t('application_helper.never_logged')
    else
      period = (Time.now - user.last_sign_in_at).to_i / 1.day

      if period > 1
        t('application_helper.last_logged', time: period)
      else
        t('application_helper.logged_today')
      end
    end
  end

  def pretty_datetime(date)
    date.strftime('%d.%m.%Y ')+t('time.at_hour')+date.strftime('%I:%M%p')
  end

  def pretty_date(date)
    date.strftime('%d.%m.%Y')
  end

  def datespan(dates)
    dates.map { |date| pretty_date(date) }.join(' - ')
  end

  def colors
    %w[red orange yellow olive green teal blue violet purple pink brown grey black]
  end

  def organisers
    {
      ania: {
        name: "Ania Łeń",
        roles: %w[Organiser Creator]
      },
      pawel: {
        name: "Paweł Piwek",
        roles: %w[Organiser Creator] },
      marta: {
        name: "Marta Mościcka",
        roles: %w[Organiser Admin] },
      grzegorz: {
        name: "Grzegorz Dłużewski",
        roles: %w[Organiser MatSquad] },
      szymon: {
        name: "Szymon Zwara",
        roles: %w[Organiser] },
      kobak: {
        name: "Mateusz Kobak",
        roles: %w[Organiser MatSquad] },
      tomek: {
        name: "Tomasz Przybyłowski",
        roles: %w[Organiser MatSquad] },
      sebastian: {
        name: "Sebastian Gołojuch",
        roles: %w[Organiser] }
    }
  end

  def past_commitiee
    {
      piotr: {
        name: "Piotr Ambroszczyk",
        roles: %w[Organiser MatSquad] },
      dominik: {
        name: "Dominik Cieśliński",
        roles: %w[Organiser] }
    }
  end

  def consultants
    {
      fornal: {
        name: "Jan Fornal",
        roles: %w[Consultant]
      }
    }
  end

end
