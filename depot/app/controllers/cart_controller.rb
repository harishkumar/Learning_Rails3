class CartController < ApplicationController
  def my_cart_page
    if request.post?
     @cart=Cart.new(params[:cart])
      if @cart.save
        price=Product.find(@cart.product_id).price
        @cart.update_attribute(:total_price,@cart.quantity * price)
        if params[:commit]=="Save and continue shopping"
          redirect_to :controller=>"buyer",:action=>"catalog"
        elsif params[:commit]=="Save and Pay"
          redirect_to "http://hdfcbank.com"
        end
      end
    end
  end

  def display_total
    @total=(params[:count].to_i * params[:price].to_i)
    respond_to do |format|
      format.js
    end
     #render :js=>"$('#total').html(#{render(:partial=>'total_price')});"
 
    # render :js=>"$('#total').html(#{total});$('#cart_total_price').value(#{total});"
  end
end
