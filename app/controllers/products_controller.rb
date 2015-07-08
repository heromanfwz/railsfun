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

	def edit
		@product = Product.find(params[:id])
		render :new
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			flash[:notice] = 'Update successfully'
			redirect_to products_url
		else
			flash.now[:notice] = 'Failed ......hmmmmmm'
			render	:new
		end
	end

		def destroy
    @product = Product.find(params[:id])
    if @product.destroy
    	flash[:notice] = 'Deleted successfully'
			redirect_to products_url
		else
			flash.now[:notice] = 'Deleted failed......'
			redirect_to products_url
		end

	end

	def create
		@product = Product.new(product_params)
		
		if @product.save
			flash[:notice] = 'You have successfully created the product'
			redirect_to products_url
		else
			flash.now[:notice] = 'There is an error in your form'
			render	:new
		end

	end

	private

	def product_params
	params.require(:product).permit( :title,
													  :description,
													  :price,
													  :published,
													  :category_id )
	end

end