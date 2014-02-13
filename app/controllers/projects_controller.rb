class ProjectsController < ApplicationController
	
	# Before the mentioned controller methods are called, find_project is called to check if project with id exists
	before_filter :find_project, only: [:show, :edit, :update, :destroy]
	before_filter :authorize_admin!, except: [:index, :show]

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
			redirect_to @project, flash: { success: "Project has been created."}
		else
			flash[:alert] = "Project has not been created."
			render action: "new"
		end

	end

	def update
		@project = Project.find(params[:id])
		if @project.update_attributes(project_params)
			redirect_to @project, flash: {success: "Project has been updated."}
		else
			flash[:alert] = "Project has not been updated."
			render action: "edit" 
		end
	end

	def show
		@project = Project.find(params[:id])
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to projects_path 
		flash[:notice] = "Project has been deleted."
	end

	private

	def find_project
		@project = Project.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:alert] = "The project you were looking for could not be found."
			redirect_to projects_path
	end

# With rails 4, every attribute modification must be explicitly permitted.
  def project_params
    params.require(:project).permit(:name, :description)
  end
end
