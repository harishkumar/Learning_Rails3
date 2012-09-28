class BuyerController < ApplicationController
  def catalog
    @products=Product.all
  end

  def add_to_cart
    #redirect_to :action=>'catalog'
    @product=Product.find(params[:id])
    Cart.create(:description=>@product.description,:product_id=>@product.id,:buyer_id=>session[:user_id],:seller_id=>@product.user_id,:date=>Date.today,:time=>Time.now)
    #render :js=>"$('#cart_block').html(#{escape_javascript(render :partial=>'add_to_cart_list').html_safe})"
    respond_to do |format|
      format.js
    end

  end
end
