require 'faker'

5.times do
  Article.create(
    title: Faker::GreekPhilosophers.quote,
    lede: Faker::DumbAndDumber.quote,
    body: Faker::HowIMetYourMother.quote,
    author: Faker::HowIMetYourMother.character,
    category_id: 1, 
    user_id: 1
  )
end

User.create(email: "member@mail.com", password: "password", first_name: "Member", last_name: "Member", role: 0)
User.create(email: "journalist@mail.com", password: "password", first_name: "Journo", last_name: "Journo", role: 1)

categories = ["Sports", "Politics", "Health", "Finance", "Entertainment"]

categories.each do |category| 
  Category.create(name: category)
end

