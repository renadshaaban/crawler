class Api::V1::ProductsController < ApplicationController
	
	def index
		@products=Product.all
		render json: JSON.pretty_generate(Product.index_response), status: 200
	end
end
