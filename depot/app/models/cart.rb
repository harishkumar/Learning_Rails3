class Cart < ActiveRecord::Base
  attr_accessible :buyer_id, :date, :description, :price, :product_id, :quantity, :seller_id, :time, :total_price

end
