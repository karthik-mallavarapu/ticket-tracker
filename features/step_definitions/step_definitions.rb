Given(/^I am on the homepage$/) do
	visit('/')
end

When(/^I follow "(.*?)"$/) do |arg1|
	click_on(arg1)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
fill_in(arg2, with: arg1)
end

When(/^I press "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
