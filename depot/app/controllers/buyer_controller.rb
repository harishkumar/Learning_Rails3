class BuyerController < ApplicationController
  def catalog
    @products=Product.all
  end

  def add_to_cart
    DepotMailer.registration_confirmation.deliver
    redirect_to :action=>'catalog'
  end
end
