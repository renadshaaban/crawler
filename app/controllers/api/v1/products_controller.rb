class Api::V1::ProductsController < ApplicationController
	#require 'nokogiri'
	#require 'open-uri'
	def index
		@products=Product.all
		render json: JSON.pretty_generate(Product.index_response), status: 200
	end
end
