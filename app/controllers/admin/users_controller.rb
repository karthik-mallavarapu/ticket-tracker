class Admin::UsersController < Admin::BaseController

  def index
  	@users = User.order('email')
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
    @user.confirm!
  	if @user.save
  		flash[:notice] = "User has been created."
  		redirect_to admin_users_path
  	else
  		flash[:alert] = "User has not been created."
  		render action: "new"
  	end
  end

  def edit
  	@user = User.find(params[:id])	
  end

  def update
  	@user = User.find(params[:id])	
  	if params[:user][:password] == ""
  		params[:user].delete(:password)
  	end  	
  	if @user.update_attributes(user_params)
  		flash[:notice] = "User has been updated."
  		redirect_to admin_users_path	
  	else
  		flash[:alert] = "User has not been updated."
  		render action: "edit"		
  	end
  end

  def destroy
    @user = User.find(params[:id])
    if @user == current_user
      flash[:alert] = "You cannot delete yourself!"
    else
      @user.destroy
      flash[:notice] = "User has been deleted."
    end
    redirect_to admin_users_path

  end

  private 
  # With rails 4, every attribute modification must be explicitly permitted.
  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end
  
end
