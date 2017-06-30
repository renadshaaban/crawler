class Product < ApplicationRecord

	def self.index_response
      {
        results: "ok" ,
        products: Product.all.map{|e| 
          { product_id:e.id , name:name , 
            price: e.price
          }}
      }
    end
end
