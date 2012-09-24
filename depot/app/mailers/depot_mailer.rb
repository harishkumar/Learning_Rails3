class DepotMailer < ActionMailer::Base
  default :from => "eabyas.notifier@gmail.com"

  def registration_confirmation
   mail(:to => 'hksswathi@gmail.com', :subject => "Registered")
  end

end
