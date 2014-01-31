require 'spec_helper'

describe ProjectsController do
	it "displays an error and redirects to home page if project id is not found" do
		get :show, id: "dummy"
		response.should redirect_to projects_path
		flash[:alert].should eql "The project you were looking for could not be found."
	end
end
