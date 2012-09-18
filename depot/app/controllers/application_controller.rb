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
end
