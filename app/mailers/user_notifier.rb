class UserNotifier < ActionMailer::Base
  default from: "sadda.ravikumar@gmail.com"

def signup_mail(user)
	@user = user
	mail(:to => (user.email), subject: 'Weclome to Nellore Shoe Mart')
end

def forget_password_mail(user,password)
	@user = user
	@password = password
	mail(:to => (user.email), subject: 'Weclome to Nellore Shoe Mart')
end

def reset_password_mail(user)
	@user = user
	mail(:to => (user.email), subject: 'Weclome to Nellore Shoe Mart')
end

def purchase_complete_mail(user,cart)
	@user = user
	mail(:to => (user.email), subject: 'your order has been processed, thank you for shopping with us!')
end

end
