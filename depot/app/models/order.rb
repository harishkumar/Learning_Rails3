class Order < ActiveRecord::Base
  attr_accessible :buyer_id, :order_number, :quantity, :reciept_no, :seller_id
  belongs_to :product
end
