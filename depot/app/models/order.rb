class Order < ActiveRecord::Base
  attr_accessible :buyer_id, :order_number, :quantity, :reciept_no, :seller_id,:shopping_date,:shopping_time,:payment_amount,:approval,:product_id
  belongs_to :product
end
