class CartController < ApplicationController
  def my_cart_page
   @product=Product.find(params[:id])
    
  end

  def display_total
    total=(params[:count].to_i * params[:price].to_i)
     render :js=>"$('#total').html(#{total})"
  end
end
