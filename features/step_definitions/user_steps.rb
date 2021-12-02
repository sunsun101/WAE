Given("I am a new user") do
  @user = FactoryBot.build :user
end

When("I visit the main page") do
  visit authenticated_root_url
end

Then("I should see a {string} link") do |string|
  expect(page).to have_link("Sign up", href: new_user_registration_path)
end

When("I click the {string} link") do |string|
  find_link("Sign up", href: new_user_registration_path).click
end

Then("I should see a signup form") do
  expect(page).to have_selector("form#new_user")
end

When("I fill in the signup form") do
  fill_in "Name", with: @user.name
  fill_in "Email", with: @user.email
  fill_in "Password", with: @user.password
  fill_in "Password confirmation", with: @user.password_confirmation
  click_button "Sign up"
end

Then("I should be logged in") do
  expect(page).to have_link("Sign out", href: destroy_user_session_path)
end

Then("I should see my profile") do
  expect(page).to have_content @user.name
  expect(page).to have_content @user.email
end

Given("I am an existing user") do
  @user = FactoryBot.create :user
end

Then("I should see a {string} form") do |string|
  expect(page).to have_selector('form#new_user')
end

When("I fill in the login form") do
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Log in'
end
