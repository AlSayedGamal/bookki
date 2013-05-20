# Givens
Given /^I am a guest$/ do
  @guest ||= create_guest
  visit '/sign_out'
end

Given /^(?:I (have|am)|there (?:is|are)) the following users?$/ do |who, users_table|
  @session_users ||= {}
  users_table.map_headers! do |cell|
    cell.downcase.gsub(/\s/, '_').to_sym
  end

  users_table.hashes.each do |user_hash|
    user = create_user(user_hash)
    @session_users[user.email] = user
    @user = user if (who == 'am')
  end
end

Given /^I am logged out$/ do
  step %q{I go to the sign out page}
end

Given /^I am logged in$/ do
  visit path_for('login')

  fill_in 'Email', with: @user[:email]
  fill_in 'Password', with: @user[:plain_text_password]
  click_button 'Sign in'
end

# Whens
When /^I fill in my details$/ do
  within '.sign-up' do
    fill_in 'Email', with: @guest[:email]
    fill_in 'Username', with: @guest[:username]
    fill_in 'Password', with: @guest[:password], exact: true
    fill_in 'Password Confirmation', with: @guest[:password]
  end
end
