Given('the following articles exists') do |table|
  table.hashes.each do |article|
      user = User.find_by(first_name: article[:user_id])
      category = Category.find_or_create_by(name: article[:category_id])
      article.except!(article[:user_id]).except!(article[:category_id]).merge!(user_id: user.id).merge!(category_id: category.id)
      FactoryBot.create(:article, article)
  end
end

Given("the following categories exists") do |table|
  table.hashes.each do |category|
    create(:category, category)
  end
end

Given("the following user exists") do |table|
  table.hashes.each do |user|
    create(:user, user)
  end
end