class TicketsController < ApplicationController
	
	before_filter :find_project
	before_filter :authenticate_user!, :except => [:index, :show]
	before_filter :authorize_create!, only: [:new, :create]
	before_filter :find_ticket, only: [:show, :edit, :update, :destroy]
	before_filter :authorize_edit!, only: [:edit, :update]
	before_filter :authorize_delete!, only: [:destroy]
	
	def new
		@ticket = @project.tickets.build
	end

	def create
		@ticket = @project.tickets.build(ticket_params.merge!(user: current_user))
		if @ticket.save
			redirect_to [@project, @ticket], flash: {success: "Ticket has been created."}
		else
			flash[:alert] = "Ticket has not been created."
			render action: "new"
		end
	end

	def show

	end

	def edit

	end

	def update
		if @ticket.update_attributes(ticket_params)
			flash[:notice] = "Ticket has been updated."
			redirect_to [@project, @ticket]
		else
			flash[:alert] = "Ticket has not been updated."
			render action: "edit"	
		end		
	end

	def destroy
		@ticket.destroy
		flash[:notice] = "Ticket has been deleted."
		redirect_to @project
	end
	
	private

	def authorize_create!
		if !current_user.admin? && cannot?("create tickets".to_sym, @project)
			flash[:alert] = "You cannot create tickets on this project."
			redirect_to @project
		end
	end

	def authorize_delete!
		if !current_user.admin? && cannot?("delete tickets".to_sym, @project)
			flash[:alert] = "You cannot delete tickets on this project."
			redirect_to @project
		end
	end
	
	def authorize_edit!
		if !current_user.admin? && cannot?("edit tickets".to_sym, @project)
			flash[:alert] = "You cannot edit tickets on this project."
			redirect_to @project
		end
	end

	def find_project
		@project = Project.for(current_user).find(params[:project_id])
		rescue
			flash[:alert] = "The project you were looking for could not be found."
			redirect_to root_path
	end

	def find_ticket
		@ticket = @project.tickets.find(params[:id])	
		rescue
			flash[:alert] = "The ticket you were looking for could not be found."
			redirect_to @project	
	end

	def ticket_params
    	params.require(:ticket).permit(:title, :description, :user_id, :state, :priority)
  	end
end
