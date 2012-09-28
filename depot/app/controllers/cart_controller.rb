class CartController < ApplicationController
  def my_cart_page
    @car=Cart.find_all_by_buyer_id_and_date(session[:user_id],Date.today)
    if request.post?
      order_number=create_order
      prev_rec=Order.last
      count=0
           if prev_rec.blank?
          reciept_num=1
           else
          reciept_num=prev_rec.reciept_no.to_i+1
           end
      @car.each do |car|
         if params['cart']["confirm#{car.id}"]=="1"
          quantity=params['cart']["quantity#{car.id}"].to_i
          price=Product.find(car.product_id).price
          car.update_attributes(:quantity=>params["quantity#{car.id}"],:total_price=>quantity * price)
          Order.create([{:order_number=>order_number,:seller_id=>car.seller_id,:buyer_id=>car.buyer_id,:reciept_no=>reciept_num,:quantity=>quantity,:shopping_date=>car.date,:shopping_time=>car.time,:payment_amount=>car.total_price,:product_id=>car.product_id}])
           count=count+1
         end
      end
      Cart.destroy(@car)
        if count==0
      mess="No Products selected..!"
      else
      mess="Payment Done Sucessfully..You will get email when Seller Approved Payment..!"
      end
      redirect_to :controller=>"buyer",:action=>"catalog",:mess=>mess
    end
  end

  def display_total
    
    @price=Product.find(Cart.find(params[:cart]).product_id).price
    @total=(params[:count].to_i * @price)
    respond_to do |format|
      format.js
    end
     #render :js=>"$('#total').html(#{render(:partial=>'total_price')});"
 
    # render :js=>"$('#total').html(#{total});$('#cart_total_price').value(#{total});"
  end
end
