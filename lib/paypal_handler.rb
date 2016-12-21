module PaypalHandler
	require 'paypal-sdk'
	include Paypal::SDK::REST

	def create(params)
		p = Payment.new(params)
		p.create

		
		if extraer_url
			return url
		else
			return error
		end
	end

	def return(params)
		payer = payer_id
		payment_id = payment_id

		p = Payment.find payment_id

		if p.execute
			return p
		else
			return false
		end
	end
end