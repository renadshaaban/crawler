=begin
desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."
  NewsFeed.update
  puts "done."
end

task :send_reminders => :environment do
  User.send_reminders
end
=end

namespace :product_test do
  desc "Fetch All Products"
  task :fetch_products => :environment do
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
		@p=Product.new(:name => name, :price => price)
		@p.save!
	end
  end
end