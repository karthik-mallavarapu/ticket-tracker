class ProjectsController < ApplicationController
	def index

	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		@project.save
		flash[:notice] = "Project has been created"	
		redirect_to @project
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
