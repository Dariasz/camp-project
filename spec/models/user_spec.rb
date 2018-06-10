require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create :user }

  it {
    is_expected.to define_enum_for(:role).with_values(
      admin: 0,
      organizer: 1,
      tutor: 2,
      semitutor: 3,
      volunteer: 4,
      applicant: 5,
      mugol: 6,
      camper: 7,
      tester: 8
    )
  }

  it { is_expected.to define_enum_for(:nationality).with_values(PL: 0, CZ: 1, SK: 2, HU: 3) }

  describe 'associations' do
    it { is_expected.to have_many(:user_activities) }
    it { is_expected.to have_many(:activities).through(:user_activities) }
    it { is_expected.to have_many(:owned_activities).class_name('User').with_foreign_key('author_id') }
    it { is_expected.to have_many(:solutions).class_name('User').with_foreign_key('author_id') }
    it { is_expected.to have_many(:feedbacks) }
    it { is_expected.to have_many(:events).through(:feedbacks) }
  end

end