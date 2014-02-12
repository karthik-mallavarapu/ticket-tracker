# Creating an admin user
admin = User.create!(email: 'admin@tickettracker.com', password: '12345678', admin: true)
admin.confirm!
admin.save

# Creating a normal user
user1 = User.create!(email: 'user1@tickettracker.com', password: '12345678', admin: false)
user1.confirm!

user2 = User.create!(email: 'user2@tickettracker.com', password: '12345678', admin: false)
user2.confirm!
# Creating some projects
project1 = Project.create!(name: 'Responsive layout', description: 'Modify the look and feel of the UI with a new frontend framework that supports responsive layouts.')
project2 = Project.create!(name: 'Backend refactoring', description: 'Optimize the backend to perform fewer queries.')

ticket1 = project1.tickets.build(title: 'IE9 compatibility', description: 'Images are not aligned properly on Internet Explorer 9', priority: 'low', state: 'open', user_id: user1.id)
ticket1.save

ticket2 = project1.tickets.build(title: 'Font size on mobile devices', description: 'Font size needs to be adjust for display on phones and tablets', priority: 'high', state: 'open', user_id: user2.id)
ticket2.save

ticket3 = project1.tickets.build(title: 'Grid layout', description: 'Current layout is not fluid.', priority: 'medium', state: 'open', user_id: user1.id)
ticket3.save

ticket4 = project2.tickets.build(title: 'Background job worker', description: 'Background job worker is cpu hungry.', priority: 'low', state: 'open', user_id: user2.id)
ticket4.save

ticket5 = project2.tickets.build(title: 'Running time of a background job', description: 'Running time of background job worker exceeds its default timeout', priority: 'low', state: 'open', user_id: user1.id)
ticket5.save