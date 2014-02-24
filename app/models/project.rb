class Project < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	#validates :description, length: {maximum: 100}
	has_many :tickets, :dependent => :delete_all
	has_many :permissions, as: :subject
	scope :readable_by, lambda {|user| joins(:permissions).where(permissions: {user_id: user.id, action: "view"})}

	def self.for(user)
		user.admin? ? Project : Project.readable_by(user)	
	end
end
