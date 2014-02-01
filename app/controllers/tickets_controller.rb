class TicketsController < ApplicationController
	
	before_filter :find_project

	def new
		@ticket = @project.tickets.build
	end

	def create
		@ticket = @project.tickets.build(ticket_params)
		if @ticket.save
			redirect_to [@project, @ticket], flash: {success: "Ticket has been created."}
		else
			flash[:alert] = "Ticket has not been created."
			render action: "new"
		end
	end

	def show
		@ticket = @project.tickets.find(params[:id])
	end
	
	private

	def find_project
		@project = Project.find(params[:project_id])
	end

	def ticket_params
    	params.require(:ticket).permit(:title, :description)
  	end
end
