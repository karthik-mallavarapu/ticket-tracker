require 'spec_helper'
describe TicketsController do
    
    let(:user) do
  		user = create(:user)
		user.confirm!
		user
	end

	let(:project) {create(:project)}

	let(:ticket) {create(:ticket, project: project, user: user)}

    context "with permission to view the project" do
        
        before do
            sign_in(:user, user)
            Permission.create!(user_id: user.id, subject: project, action: "view")
        end

        def cannot_create_tickets
            response.should redirect_to project
            flash[:alert].should eql "You cannot create tickets on this project."
        end

        def cannot_edit_tickets
            response.should redirect_to project
            flash[:alert].should eql "You cannot edit tickets on this project."
        end
        
        def cannot_destroy_tickets
            response.should redirect_to project
            flash[:alert].should eql "You cannot delete tickets on this project."
        end

        it "cannot invoke the new action" do
            get :new, project_id: project.id
            cannot_create_tickets
        end

        it "cannot invoke the create action" do 
            post :create, project_id: project.id
            cannot_create_tickets
        end

        it "cannot invoke the edit action" do
            get :edit, {project_id: project.id, id: ticket.id}
            cannot_edit_tickets
        end

        it "cannot invoke the update action" do
            put :update, {project_id: project.id, id:ticket.id, ticket: {}} 
            cannot_edit_tickets
        end

        it "cannot invoke the destroy action" do
            delete :destroy, {project_id: project.id, id:ticket.id}
            cannot_destroy_tickets
        end
    end

    context "standard users" do
        it "cannot access a ticket for a project" do
            sign_in(:user, user)
            get :show, id: ticket.id, project_id: project.id
            response.should redirect_to(root_path)
            flash[:alert].should eql("The project you were looking for could not be found.")
        end      
    end
end

