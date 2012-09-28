class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :login_required,:except=>[:login]

  def login_required
    if session[:user_id]==nil
      redirect_to "http://localhost:3000/"
    end
  end

  def authenticate(username,password)
  User.find_by_email_and_password(username,password)
  end

  def create_order
    date=Date.today
    time=Time.now
    order_number="#{session[:user_id]}#{date.day}#{date.year}#{date.mon}#{time.hour}#{time.min}"
    return order_number
  end

end
