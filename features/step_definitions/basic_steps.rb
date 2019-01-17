When("I visit the site") do
    visit root_path
end

Given("the following user exists") do |table|
  table.hashes.each do |user|
    user = create(:user, user)
  end
end

Given("visit Sign up page") do
  visit new_user_registration_path
end


Given("I am logged in as {string}") do |email|
  @user = User.find_by email: email
  login_as @user, scope: :user
  visit root_path
end

When("I fill in {string} with {string}") do |element, value|
  fill_in element, with: value
end

When("I click {string}") do |element|
  click_on element
end

When("I click to accept the alert message") do
  alert = page.driver.browser.switch_to.alert
  alert.accept
end

When("I select {string} from {string}") do |option, selection|
  select option, from: `product.#{selection}`
end

When("I attach a file") do
  attach_file('article_image', "#{::Rails.root}/spec/fixtures/basic_image.png")
end
