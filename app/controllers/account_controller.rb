class AccountController < ApplicationController

def signup
	@user = User.new
	if request.post?
	    @user = User.new(params[:user].permit(:name,:email,:hashed_password,:password))
            if @user.save
            	UserNotifier.signup_mail(@user).deliver
    	        redirect_to account_login_path
            else
                render account_signup_path
            end
    end
end

def login
	if request.post?
		@user = User.authenticate(params[:user][:email],params[:user][:password])
		if @user
			session[:user]=@user
			redirect_to gallery_index_path
			
		else  
			flash[:notice] = "Invalid Username / Password wrong : try again"
		        render account_login_path
			
		end
	end
end

def forget_password
	if request.post?
			@user = User.find_by_email(params[:user][:email])
			if @user
			   new_password = random_password	
			    
			   @user.update(:password=>new_password)
				UserNotifier.forget_password_mail(@user,new_password).deliver
				flash[:notice] = "A new password has been sent your email"
			   redirect_to account_login_path
			else
			   flash[:notice]="Invalid Email.Please enter correct email"
			   render account_forget_password_path
			end
		
	end
end

def reset_password
	@user = User.find(session[:user])
		
		if request.post?			
			if @user
			@user.update(:password=>params[:user][:password])
			UserNotifier.reset_password_mail(@user).deliver
			flash[:notice] = "Your password has been reset"
			redirect_to account_index_path
			
			else
				render account_reset_path
				
			end
		end
end

def random_password
	   (0...8).map{65.+(rand(25)).chr}.join
end

def logout
		session[:user]=nil
		flash[:notice]="You've signed out. See you again soon!"
		redirect_to gallery_index_path
end

end
