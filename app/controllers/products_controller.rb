class ProductsController < ApplicationController

  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,only: [:new, :create, :edit, :update, :destroy]

  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @product = current_user.products.new
  end

  def create
    @product = current_user.products.create(product_params)
    if @product.save
      flash[:notice] = "Saved successfully"
      redirect_to @product
    else
      flash[:notice] = "Could not be saved"
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "Updated successfully"
      redirect_to @product
    else
      render "edit"
    end
  end

  def destroy
    @product.delete
    flash[:notice] = "Deleted successfully"
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :description, :user_id, :image)
    end

    def find_product
      @product = Product.find(params[:id])
    end
end
