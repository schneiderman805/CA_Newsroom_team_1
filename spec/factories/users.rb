FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@mail.com" }
    password {'password'}
    password_confirmation {'password'}
    first_name {'Hanna'}
    last_name {'Nyman'}
    role {'member'}
  end
end