Then("I should see {string}") do |content|
  expect(page).to have_content content
end

Then("I should see Navbar") do
  expect(page).to have_css '.navbar'
end

Then("I should not see {string}") do |content|
  expect(page).to have_no_content content
end

Then("I am on Create article page") do
  expect(current_path).to eq new_cms_article_path
end

Then("I should be on journalist index page") do
  expect(current_path).to eq cms_articles_path
end

Then("I am on Sign up page") do
  expect(current_path).to eq new_user_registration_path
end
