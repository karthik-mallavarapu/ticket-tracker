Given(/^I am on the homepage$/) do
	visit('/')
end

When(/^I follow "(.*?)"$/) do |arg1|
	click_on arg1
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
	fill_in(arg1, with: arg2)
end

When(/^I press "(.*?)"$/) do |arg1|
	click_on arg1
end

Then(/^I should see "(.*?)"$/) do |arg1|
	raise "Did not find #{arg1}" unless has_content?(arg1)
end

Given(/^there is a project called "(.*?)"$/) do |arg1|
	Project.create(name: arg1) 
end

Then(/^I should be on the project page for "(.*?)"$/) do |arg1|
	raise "Did not find the project #{arg1}" unless has_content?(arg1) 
end
