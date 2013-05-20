# Whens
When /^I go to (?:the\s)?(.+) page(?: with (post) request)?$/ do |page_name, post|
  path = path_for(page_name)

  if post
    page.driver.browser.reset_host!
    page.driver.browser.process(:post, path)
  else
    visit path
  end
end

When /^I click (?:the\s)?(.+) button$/ do |button|
  click_button button
end

When /^I fill in (.*?) with "(.*?)"$/ do |field, value|
  fill_in field, with: value
end

When /^I attach "(.*?)" to (.*?)$/ do |filename, field|
  attach_file field, fixture_file(filename)
end

When /^I click (.*?) link$/ do |title|
  click_link title
end

When /^I select "(.+)" from (.+) combobox$/ do |option, combobox|
  select option, from: combobox
end

When /^(.*?) within (?:the )?([^"]*)$/ do |step_str, within_elm|
  within selector_for_within(within_elm) do
    step(step_str)
  end
end

# Thens
Then /^I should go to (?:the\s)?(.+) page$/ do |page_name|
  if current_url.index('?') # Clumsy way to see if we got query
    Regexp.new(Regexp.escape(path_for(page_name))).should =~ current_url
  else
    current_path.should == path_for(page_name)
  end
end

Then /^I should (?:be|stay) on (.+)$/ do |page_name|
  step "I should go to #{page_name}"
end

Then /^I should(\snot)? see (?:(?:this\s|the\s)message\s)?"(.*?)"(?: (\d+) times?)?$/ do |negate, message, count|
  count = count.to_i unless count.nil?
  page.send(negate ? :should_not : :should, have_content(message))
  page.text.scan(/(#{message})/).count.send(negate ? :should_not : :should, eq(count)) if count.present?
end