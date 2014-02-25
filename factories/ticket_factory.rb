FactoryGirl.define do
  factory :ticket, class: Ticket do |ticket|
  	ticket.title "Default ticket name"
  	ticket.description "Default description"
  	ticket.state "open"
  	ticket.priority "low"
  	ticket.user {|u| u.association(:user) }
  	ticket.project {|p| p.association(:project) }
  end
end