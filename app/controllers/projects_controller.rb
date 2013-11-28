class ProjectsController < ApplicationController
	def index

	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		@project.save
		redirect_to @project, :flash => { :success => "Project has been created."}
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
