class Admin::UsersController < ApplicationController
  def index
		@users = User.all(:order => "email")
  end

	def new
		@user = User.new
	end

	def create
# adding
		@user = User.new
		@user.assign_attributes({"email" => params[:user][:email], "password" => params[:user][:password],
														 "admin" => params[:user][:admin] == "1" }, :as => :admin)
# end adding?
		if @user.save
		  flash[:notice] = "User has been created."
		  redirect_to admin_users_path
		else
		  flash[:alert] = "User has not been created."
		  render :action => "new"
		end
	end

# adding ??
protected

	def user_params
		role = admin ? :admin : :default
		sanitize_for_mass_assignment(params[:user], role)
	end
#end adding ??

end
