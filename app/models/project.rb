class Project < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	#validates :description, length: {maximum: 100}
	has_many :tickets, :dependent => :delete_all
end
