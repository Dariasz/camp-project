require 'rails_helper'

RSpec.describe Edition, type: :model do
  let(:edition) { create :edition }

  describe 'associations' do
    it { is_expected.to have_many(:sequences) }
    it { is_expected.to have_many(:events) }
  end

end