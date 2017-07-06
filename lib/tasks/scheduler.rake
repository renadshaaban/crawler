namespace :product_test do
  desc "Fetch All Products"
  task :fetch_products => :environment do
  	require 'nokogiri'
  	require 'open-uri'
  	Product.delete_all

    #Walmart
  	url = "https://www.walmart.com/search/?query=batman"
    page = Nokogiri::HTML(open(url))

    #Amazon
    #url = "https://www.amazon.com/s?url=search-alias%3Daps&field-keywords=batman"
    #page = Nokogiri::HTML(open(url,
    #"User-Agent" => "Ruby/#{RUBY_VERSION}",
    #"From" => "renad.shaaban@gmail.com"
    #))

    li_all=page.css('li')
    names_array=[]
    li_array=[]
    img_array=[]

    li_all.each do |li|
      @p=Product.new
      href=li.css("a[href]")
      img=li.css("img")
      if href.text.downcase.include? "batman"
        img_array.push(img.attr('src'))
        li_array.push(li)
        @p.image=img.attr('src')
        href.text.split("\n").each do |name|
          if name.downcase.include? "batman"
            names_array.push(name)
            puts name
            @p.name=name
          end
        end
      end
      @p.save
    end
  end
end