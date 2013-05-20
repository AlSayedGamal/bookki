# Givens
Given /^I am a guest$/ do
  @guest ||= create_guest
  visit '/users/sign_out'
end

Given /^(?:I (have|am)|there (?:is|are)) the following users?$/ do |who, users_table|
  @session_users ||= {}
  users_table.map_headers! do |cell|
    cell.downcase.gsub(/\s/, '_').to_sym
  end
  if users_table.hashes.count > 1
    users_table.hashes.each do |user_hash|
      user = create_user(user_hash)
      @session_users[user.email] = user
    end
  else
    @user = create_user(users_table.hashes.first)
  end
end

Given /^(?:I (have|am)|there (?:is|are)) the following admins?$/ do |who, users_table|
  @session_admins ||= {}
  users_table.map_headers! do |cell|
    cell.downcase.gsub(/\s/, '_').to_sym
  end
  if users_table.hashes.count > 1
    users_table.hashes.each do |user_hash|
      user = create_user(user_hash)
      user.update_attributes(admin: true)
      @session_admins[user.email] = user
    end
  else
    @user = create_user(users_table.hashes.first)
    @user.update_attributes(admin: true)
  end
end

Given /^I am logged out$/ do
  step %q{I go to the sign out page}
end

Given /^I am logged in$/ do
  visit path_for('login')
  # debugger
  fill_in 'Username', with: @user[:username]
  fill_in 'Password', with: @user[:plain_text_password]
  click_button 'Sign in'
end

# Whens
When /^I fill in my details$/ do
  within '.span9' do
    fill_in 'Email', with: @guest[:email]
    fill_in 'Username', with: @guest[:username]
    fill_in 'Password', with: @guest[:password], exact: true
    fill_in 'Password confirmation', with: @guest[:password]
  end
end
