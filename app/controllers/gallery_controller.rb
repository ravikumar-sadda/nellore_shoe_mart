class GalleryController < ApplicationController
  def index
  	@shoes_gallery = Store.all
  end

  def checkout
  	amount_to_charge = params[:amount].to_i
		if request.post?
		ActiveMerchant::Billing::Base.mode = :test
		# ActiveMerchant accepts all amounts as Integer values in cents
		#amount = 100
		credit_card = ActiveMerchant::Billing::CreditCard.new(
		:first_name         => params[:check][:first_name],
		:last_name          => params[:check][:last_name],
		:number             => params[:check][:credit_no].to_i,
		:month              => params[:check][:month].to_i,
		:year               => params[:check][:year].to_i,
		:verification_value => params[:check][:verification_number].to_i)

		# Validating the card automatically detects the card type
			if credit_card.valid?
			gateway =ActiveMerchant::Billing::TrustCommerceGateway.new(
			:login => 'TestMerchant',
			:password =>'password',
			:test => 'true' )
			response = gateway.authorize(amount_to_charge , credit_card)
			#response = gateway.purchase(amount_to_charge, credit_card)
				if response.success?
					gateway.capture(amount_to_charge, response.authorization)
					flash[:notice] = "Authorized #{response.inspect}"
				else
					flash[:notice] = "Not Authorized #{response.inspect}"
					render :text => 'Fail:' + response.message.to_s and return
				end
			else
				render :text =>'Credit card not valid: ' + credit_card.validate.to_s and return
			end

		UserNotifier.purchase_complete_mail(session[:user],current_cart).deliver
		flash[:notice]="Thank You for using Amaron Beats. The oreder details are sent to your mail"
		session[:cart_id]=nil
		redirect_to gallery_purchase_complete_path
	        end
  end

  def purchase_complete
  end

  def search
  	@shoes_gallery = Store.find_by_sql ["Select * from stores WHERE product_name like ? or brand_name like ? or color like ? or description like ?",params[:search],params[:search],params[:search],params[:search]]	  
  end
end
