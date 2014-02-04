Given /^I am on the homepage$/ do
	visit('/')
end

When /^I follow "([^"]*)"$/ do |arg1|
	click_on arg1
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |arg1, arg2|
	fill_in(arg1, with: arg2)
end

When /^I press "([^"]*)"$/ do |arg1|
	click_on arg1
end

Then /^I should see "([^"]*)"$/ do |arg1|
	raise "Did not find #{arg1}" unless has_content?(arg1)
end

Given /^there is a project called "([^"]*)"$/ do |arg1|
	@project = create(:project, name: arg1)
end

Then /^I should be on the project page for "([^"]*)"$/ do |arg1|
	raise "Did not find the project #{arg1}" unless has_content?(arg1) 
end

Then /^I should not see "([^"]*)"$/ do |arg1|
	raise "#{arg1} should not be visible" unless has_content?(arg1) == false 
end

Given /^that project has a ticket:$/ do |table|
	table.hashes.each do |attributes|
		@project.tickets.create!(attributes)
	end
end

Then /^I should see "([^"]*)" within "([^"]*)"$/ do |arg1, arg2|
	within arg2 do
		raise "Did not find #{arg1}" unless has_content? arg1
	end
end