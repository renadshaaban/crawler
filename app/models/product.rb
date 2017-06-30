class Product < ApplicationRecord

	def self.index_response
      {
        results: "ok" ,
        products: Product.all.map{|e| 
          { product_id:e.id , name:name , photo:e.photo ,link: e.link,
            price: e.price
          }}
      }
    end
end
