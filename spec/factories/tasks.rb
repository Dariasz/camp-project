FactoryBot.define do
  factory :task do
    task(:name) { |n| "name-#{n}" }

    sequence { create(:sequence) }
  end
end
