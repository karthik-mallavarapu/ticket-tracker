require 'spec_helper'

describe ProjectsController do
	it "displays an error and redirects to home page if project id is not found" do
		get :show, id: "dummy"
		response.should redirect_to projects_path
		flash[:alert].should eql "The project you were looking for could not be found."
	end

	let(:user) do
  		user = create(:user)
		user.confirm!
		user
	end

	let(:project) { create(:project) }

	{'new'=>'get', 'create'=>'post', 'update'=>'put', 'destroy'=>'delete'}.each do |action, method|
		context "standard users" do
	  		it "cannot access the #{action} action" do
	    		sign_in(:user, user)
	    		send(method, action, id: project.id)
	    		response.should redirect_to(root_path)
	    		flash[:alert].should eql "You must be an admin to do that." 
	  		end
		end
	end
end
