class ProjectsController < ApplicationController
	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
	end

	def edit
		@project = Project.find(params[:id])
	end
	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to @project, :flash => { :success => "Project has been created."}
		else
			flash[:alert] = "Project has not been created."
			render action: "new"
		end

	end

	def update
		@project = Project.find(params[:id])
		@project.update_attributes(project_params)
		redirect_to @project, flash: {success: "Project has been updated."}
	end

	def show
		@project = Project.find(params[:id])
	end

	private

# With rails 4, every attribute modification must be explicitly permitted.
  def project_params
    params.require(:project).permit(:name)
  end
end
