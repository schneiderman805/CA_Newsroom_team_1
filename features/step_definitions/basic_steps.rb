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

Given('I fill in the payment form') do
  card_no = '42'
  stripe_iframe = find("iframe[name='__privateStripeFrame4']", visible: false)
  within_frame stripe_iframe do
    card_field = find_field('cardnumber')
    card_field.native.clear
    8.times { sleep 0.1; card_field.send_keys(right: card_no); sleep 0.1; }

    find_field('exp-date').send_keys('1221')
    find_field('cvc').send_keys('123')
  end
end

Then("I wait 2 seconds") do
  sleep 2
end
