class ProductsController < ApplicationController
	def index
		@products = Product.all.includes(:category).published
	end
end