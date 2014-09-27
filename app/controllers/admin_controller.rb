class AdminController < ApplicationController
  def login
		if request.post?
			if params[:admin][:name]=="admin" && params[:admin][:password]=="nimda"
				session[:admin]="admin"
				redirect_to stores_path
			else
				flash[:notice]="Invalid Name/Password"
				render admin_login_path
			end
		end

  end
  def logout
		session[:admin]=nil
		flash[:notice]="Logged out"
		redirect_to admin_login_path
	end
end
