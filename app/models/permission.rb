class Permission < ActiveRecord::Base
	belongs_to :user
	belongs_to :subject, polymorphic: true
end
