class OrdersController < ApplicationController

  def orders_list
    @orders=Order.find_all_by_seller_id(session[:user_id])
       @uniq_orders=Order.group(:order_number)
   
  end

  def approve_orders
    @orders=Order.find_all_by_order_number(params[:order_number])
    respond_to do |format|
      format.js
    end
  end

  def approval
    @orders=Order.find_all_by_order_number(params['order'][:order_number])
    count=0
    amount=0
    @orders.each do |order|
      if params['order']["approval#{order.id}"]=='1'
       amount=amount+order.payment_amount
       count=count+1
       order.update_attribute(:approval,true)
      end
    end
     email=User.find(@orders.first.buyer_id).email
     mess="Thank You for shopping..!\n Your Total bill amount is #{amount} with Reciept no: #{@orders.first.reciept_no}\n\n\n Regards\nHarish"
     DepotMailer.registration_confirmation(mess,email).deliver
     notice="Payment Done sucesfully for #{count} Products"
   
    render :js=> "$('#order_products').html('#{notice}');"
  end

end
