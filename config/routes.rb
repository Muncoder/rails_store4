Rails.application.routes.draw do

	devise_for :users

	root "pages#home"

	resources :products

	resource :carts, only: [ :show ] do
		post 'add', path: 'add/:id'
		get 'clear', path: 'clear'
		delete 'del', path: 'del/:id'
		post 'add_quantity', path: 'addquantity/:id'
		post 'remove_quantity', path: 'removequantity/:id'

		get :checkout
	end

	resources :orders, only: [ :index, :show, :create ] do
		
		member do
			get :new_payment
			post :pay
		end

	end
	
end
