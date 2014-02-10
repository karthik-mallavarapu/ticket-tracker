FactoryGirl.define do
	factory :user, class: User do |user|
		user.sequence(:email) { |n| "user#{n}@tickettracker.com" }
		user.password "password"
		user.password_confirmation "password"
	end
end