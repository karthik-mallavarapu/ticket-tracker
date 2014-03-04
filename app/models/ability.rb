class Ability

	include CanCan::Ability

	def initialize(user)
		user.permissions.each do |permission|
		    can (permission.action).to_sym, permission.subject_type.constantize do |subj| 
          subj.nil? || permission.subject_id.nil? || permission.subject_id == subj.id
        end
		end
	end
end