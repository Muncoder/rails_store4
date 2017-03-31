class CartsController < ApplicationController

	before_filter :initialize_cart

	def add
		@cart.add_item params[:id]
		session["cart"] = @cart.serialize
		redirect_to :back, notice: "Product added to cart"
	end

	def clear
		reset_session
		redirect_to products_path
	end

	def del
		@cart.remove_item params[:id]
		session["cart"] = @cart.serialize
		redirect_to :back, notice: "Item deleted successfully"
	end

	def add_quantity
		@cart.add_quantity params[:id]
		session["cart"] = @cart.serialize
		redirect_to :back, notice: "Quantity added."
	end

	def remove_quantity
		@cart.remove_quantity params[:id]
		session["cart"] = @cart.serialize
		redirect_to :back, notice: "Quantity removed."
	end

	def checkout
		@order_form = OrderForm.new user: User.new
	end
	

end