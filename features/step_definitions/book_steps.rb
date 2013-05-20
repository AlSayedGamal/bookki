And /^I should be able rate (.*) stars link$/ do |stars|
  sleep 5
  find(".span9 .star img[alt='#{stars}']").click
end