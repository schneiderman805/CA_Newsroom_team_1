Article.destroy_all
User.destroy_all
Category.destroy_all

member = User.create(email: "member@mail.com", password: "password", first_name: "Member", last_name: "Member", role: 0)
journalist = User.create(email: "journalist@mail.com", password: "password", first_name: "Journo", last_name: "Journo", role: 1)
editor = User.create(email: "editor@mail.com", password: "password", first_name: "Editoro", last_name: "Edit", role: 2)
admin = User.create(email: "admin@mail.com", password: "password", first_name: "Admino", last_name: "Admino", role: 3)

culture = Category.create(name: 'Culture')
categories = ["Sports", "Politics", "Health", "Finance", "Entertainment"]

categories.each do |category| 
    Category.create(name: category)
end

5.times do
    Article.create(title: "Title", lede: "Lorem ipsum dolor sit amet.", body:"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", author:"author", category_id: culture.id, user_id: journalist.id)
end
