FactoryBot.define do
  factory :edition do
    sequence(:name) { |n| "name-#{n}" }
    sequence(:edition_start) { |n| Time.now - n.day }
    sequence(:edition_end) { |n| Time.now - n.day }
    sequence(:camp_start) { |n| Time.now - n.day }
    sequence(:camp_end) { |n| Time.now - n.day }
    sequence(:camp_place) { |n| 'Milówka' }
  end
end
#