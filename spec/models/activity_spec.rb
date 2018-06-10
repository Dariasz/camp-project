require 'rails_helper'

RSpec.describe Activity, type: :model do
  let(:activity) { create :activity }

  it { is_expected.to define_enum_for(:group).with_values(olympic: 0, academic: 1, miscellaneous: 2) }
  it {
    is_expected.to define_enum_for(:category).with_values(
      algebra: 0, geometry: 1, number_theory: 2, combinatorics: 3, other: 4
    )
  }

  describe 'associations' do
    it { is_expected.to belong_to(:author).class_name('User').with_foreign_key('author_id') }
    it { is_expected.to have_many(:user_activities) }
    it { is_expected.to have_many(:users).through(:user_activities) }
    it { is_expected.to have_many(:events).dependent(:destroy) }
    it { is_expected.to have_many(:activity_attachments).inverse_of(:activity).dependent(:destroy) }
    it { is_expected.to accept_nested_attributes_for :activity_attachments }
  end

end