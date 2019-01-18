FactoryBot.define do
  factory :article do
    title { "MyString" }
    lede { "MyText" }
    body { "MyText" }
    author { "MyString" }
    association :user, factory: :user
    association :category, factory: :category
  end
end
