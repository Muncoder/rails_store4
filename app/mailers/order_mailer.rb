class OrderMailer < ActionMailer::Base

	default from: "munirchittagong@gmail.com"

	def order_confirmation order
		@order = order
		mail to: order.user.email, subject: "You order (##{order.id})"
	end

end