FactoryBot.define do
  factory :feedback do
    sequence(:mark) { |n| n }
    sequence(:comment) { |n| "comment-about-#{n}" }

    event { create(:event) }
    user { create(:user) }
  end
end
