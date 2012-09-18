class BuyerController < ApplicationController
  def catalog
    @products=Product.all
  end
end
