require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { create :task }

  describe 'associations' do
    it { is_expected.to have_many(:solutions) }
    it { is_expected.to belong_to(:sequence) }
  end

end