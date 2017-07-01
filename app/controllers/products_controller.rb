class ProductsController < ApplicationController
	#respond_to :html, :json
	def index
		@products=Product.all
	end
end
