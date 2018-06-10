class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    @user = user

    if user.admin?
      can :manage, :all
    elsif user.organizer?
      organizer_abilities
    elsif user.tutor?
      tutor_abilities
    elsif user.semitutor?
      semitutor_abilities
    elsif user.camper?
      camper_abilities
    elsif user.volunteer?
      volunteers_abilities
    elsif user.applicant?
      applicant_abilities
    elsif user.mugol?
      mugol_abilities
    end
  end

  private

  def mugol_abilities
    can [:index, :show, :apply_for], Edition
    can [:index, :show], Sequence
    can [:show], User
    can [:see_others], Edition do |edition|
      Time.now > edition.edition_end
    end
  end

  def applicant_abilities
    mugol_abilities
    can [:calendar], Event
    can [:my_solutions], Solution
    can [:show, :new, :edit, :update, :create, :destroy], Solution, author_id: @user.id
  end

  def camper_abilities
    applicant_abilities
    # can [:create, :my_activities], Activity
    # can [:show], Activity, confirmed: true
    # can [:show, :create, :edit, :update, :destroy], Activity, user_id: @user.id
    # can [:create, :edit, :destroy], Feedback, user_id: @user.id
    # can [:received_feedbacks, :my_feedbacks], Feedback
    # can [:destroy], ActivityAttachment, activity: { user_id: @user.id }
    # can [:see_others], Edition do |edition|
    #   edition.users.exists?(@user.id)
    # end
  end

  def tutor_abilities
    camper_abilities
  end

  def semitutor_abilities
    camper_abilities
  end

  def organizer_abilities
    can :manage, :all
  end

  def volunteers_abilities
    camper_abilities
  end
end
