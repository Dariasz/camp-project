FactoryBot.define do
  factory :sequence do
    sequence(:name) { |n| "name-#{n}" }
    sequence(:content) { |n| "content-about-#{n}" }

    edition { create(:edition) }
  end
end
