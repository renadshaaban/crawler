namespace :product_test do
  desc "Fetch All Products"
  task :fetch_prices => :environment do
  	require 'nokogiri'
  	require 'open-uri'
  	Product.delete_all
  	url = "https://www.walmart.com/search/?query=batman"
	doc = Nokogiri::HTML(open(url))
	doc.css(".u-size-1-5-xl").each do |item|
		name = item.at_css(".heading-b div").text
		price = item.at_css(".search-result-productprice").text[/[0-9\.]+/]
		#link = item.at_css(".heading-b div")[:href]
		#puts name
		#puts price
		puts "hopa"
		@p=Product.new(:name => name, :price => price)
		@p.save!
	end
  end
end
