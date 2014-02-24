
pages = {
	'Sign in' => '/users/sign_in',
	'Sign up' => '/users/sign_up'
}

Given /^I am on the homepage$/ do
	visit('/')
end

When /^I follow "([^"]*)"$/ do |arg1|
	click_on arg1
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |arg1, arg2|
	fill_in(arg1, with: arg2, match: :prefer_exact)
end

When /^I press "([^"]*)"$/ do |arg1|
	click_button arg1
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

Given /^there are the following users:$/ do |table|
	table.hashes.each do |attributes|
		user = User.create!(email: attributes['email'], password: attributes['password'])
		user.update_attribute("admin", attributes['admin'] == 'true')
		if attributes['confirmed'] == "true"
			user.confirm!
		end	
	end
end

When /^I sign in with email "([^"]*)" and password "([^"]*)"$/ do |arg1, arg2|
	fill_in 'Email', with: arg1
	fill_in 'Password', with: arg2
	click_button 'Sign in'
end

Given /^"([^"]*)" has created a ticket for this project:$/ do |email, table|
	user = User.find_by_email(email)
	table.hashes.each do |attributes|
		attributes.merge!(user: user)
		attributes[:priority] = 'low'
		@project.tickets.create!(attributes)
	end
end

Then /^I should not see the "([^"]*)" link$/ do |arg1|
	raise "Should not have found the link #{arg1}" unless page.has_link?(arg1) == false
end

Then /^I should see the "([^"]*)" link$/ do |arg1|
	raise "Did not find the link #{arg1}" unless page.has_link?(arg1)	
end

Given /^I am signed in as "([^"]*)"$/ do |arg1|
	visit '/users/sign_in'
	steps (%Q{
		When I sign in with email "#{arg1}" and password "password"	
	})
end

When /^I check "([^"]*)"$/ do |arg1|
	check arg1
end

Given /^"([^"]*)" can view the "([^"]*)" project$/ do |arg1, arg2|
	user = User.find_by_email(arg1)
	project = Project.find_by_name(arg2)
	Permission.create!(user_id: user.id, subject: project, action: "view")
end

Given /^I am on the "([^"]*)" page$/ do |arg1|
	visit pages[arg1]
end
