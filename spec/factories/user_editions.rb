FactoryBot.define do
  factory :user_edition do
    role :camper
    user { create(:user) }
    edition { create(:edition) }
  end
end
