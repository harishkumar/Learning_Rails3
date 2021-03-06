class DepotMailer < ActionMailer::Base
  default :from => "eabyas.notifier@gmail.com"

  def registration_confirmation(mess,email)
    @mess=mess
    attachments["rails.png"] = File.read("#{Rails.root}/app/assets/images/rails.png")
   mail(:to => email,:subject => "Payment")
   
  end

  def user_creation(user_id)
    @user=User.find(user_id)
    mail(:to =>@user.email,:subject => "Registration")
  end

end
