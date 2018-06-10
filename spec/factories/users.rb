FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@example.com" }
    sequence(:username) { |n| "user#{n}" }
    first_name 'Luke'
    last_name 'Skywalker'
    password 'eido1234'
    password_confirmation 'eido1234'
    role :admin
    company { create(:company) }

    User.roles.each_key do |role|
      role = role.to_sym

      trait role do
        role role
      end
    end
  end
end
