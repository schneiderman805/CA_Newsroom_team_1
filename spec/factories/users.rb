FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password {'password'}
    password_confirmation {'password'}
    first_name {'Hanna'}
    last_name {'Nyman'}
    role {'member'}
  end
end