FactoryBot.define do
  factory :activity do
    sequence(:title) { |n| "activity-title-#{n}" }
    sequence(:description) { |n| "description-#{n}" }
    level 1
    days 2
    group :olympic
    category :algebra

    author { create(:user) }

    Activity.groups.each_key do |group|
      group = group.to_sym

      trait group do
        group group
      end
    end
  end
end
