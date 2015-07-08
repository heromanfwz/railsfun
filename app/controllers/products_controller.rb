class ProductsController < ApplicationController
	def index
		@products = Product.all.includes(:category).published
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
	end


	def create
		product_params = params.require(:product).permit( :title,
														  :description,
														  :price,
														  :published,
														  :category_id )
		@product = Product.new(product_params)
		@product.save
		redirect_to products_url
	end
end