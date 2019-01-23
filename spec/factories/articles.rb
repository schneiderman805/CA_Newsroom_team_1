FactoryBot.define do
  factory :article do
    title { "MyString" }
    lede { "MyText" }
    body { "MyText" }
    author { "MyString" }
    published { false }
    association :user, factory: :user
    association :category, factory: :category

    after(:build) do |article|
      article.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'basic_image.png')),
                           filename: 'attachment.png',
                           content_type: 'image/png')
    end
  end
end
