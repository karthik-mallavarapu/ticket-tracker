class Admin::PermissionsController < Admin::BaseController

	before_filter :find_user


	def index
		@ability = Ability.new(@user)
		@projects = Project.all
	end

	def update
		@user.permissions.clear
		if params[:permissions]
			params[:permissions].each do |id, permissions|
				permissions.each do |action, checked|
					Permission.create!(user_id: @user.id, action: action, subject: Project.find(id))
				end
			end
		end
		flash[:notice] = "Permissions for the user have been updated successfully."
		redirect_to admin_users_path
	end

	private

	def find_user
		@user = User.find(params[:user_id])
	end

end
