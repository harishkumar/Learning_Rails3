class CartController < ApplicationController
  def my_cart_page
   @product=Product.find(params[:id])
    
  end
end
