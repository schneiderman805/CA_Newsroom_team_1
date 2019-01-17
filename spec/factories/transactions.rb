FactoryBot.define do
  factory :transaction do
    amount { 1 }
    association :user, factory: :user
  end
end
