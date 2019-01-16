FactoryBot.define do
  factory :comment do
    body { "MyText" }
    association :user, factory: :user
    association :article, factory: :article
  end
end
