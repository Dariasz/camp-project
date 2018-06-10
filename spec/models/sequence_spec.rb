require 'rails_helper'

RSpec.describe Sequence, type: :model do
  let(:sequence) { create :sequence }

  describe 'associations' do
    it { is_expected.to have_many(:tasks) }
    it { is_expected.to belong_to(:edition) }
  end

end