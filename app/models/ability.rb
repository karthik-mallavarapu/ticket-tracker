class Ability

	include CanCan::Ability

	def initialize(user)
		user.permissions.each do |permission|
			can (permission.action).to_sym, permission.subject_type.constantize
		end
	end
end