class DemoController < ApplicationController
  require 'addmegem'
  require 'my_mail'
  def index
    #@ans=Addmegem.kalupu(1,2)
    x=MyMail.new
    @ans=x.create_mail
    #@ans=UserMailer.send_mail('demo message','bkholyharish@gmail.com','test gem',nil).deliver
  end
end
