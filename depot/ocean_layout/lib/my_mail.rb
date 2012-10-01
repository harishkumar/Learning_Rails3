class MyMail
  def create_mail
   File.open("#{Rails.root}/app/mailers/user_mailer.rb", 'w+') do |file|
    file.syswrite(self.usermailer_text)
   end
   
   Dir.mkdir( "#{Rails.root}/app/views/user_mailer")
   Dir.mkdir( "#{Rails.root}/tmp/uploads")
   Dir.mkdir( "#{Rails.root}/app/views/email")
  
   File.open("#{Rails.root}/app/views/user_mailer/send_mail.text.erb", 'w+') do |file|
    file.syswrite("<%=@message%>")
   end

   File.open("#{Rails.root}/config/initializers/setup_mail.rb", 'w+') do |file|
     file.syswrite(self.setup_mail)
   end

   File.open("#{Rails.root}/app/controllers/email_controller.rb", 'w+') do |file|
     file.syswrite(self.email_controller)
   end

    File.open("#{Rails.root}/app/views/email/send_email.html.erb", 'w+') do |file|
     file.syswrite(self.send_email_view)
   end

   at_line=10
    File.open("#{Rails.root}/config/routes.rb",'r+') do |file|
     while (at_line-=1) > 0          # read up to the line you want to write after
      file.readline
     end
    pos = file.pos                     # save your position in the file
    rest = file.read                   # save the rest of the file
    file.seek pos                      # go back to the old position
    file.write ["\n match 'email/send_email'=>'email#send_email' \n", rest] # write new data & rest of file
   end

  end

  def usermailer_text
    @name='attachments["#{file_name}"] = File.read(path)'
    "class UserMailer < ActionMailer::Base 
      default :from => 'eabyas.notifier@gmail.com' 
        def send_mail(message,email,subject,path,file_name)
          @message=message
          unless path.nil? 
          #{@name}
          end 
          mail(:to => email,:subject => subject)
        end
     end"
  end

  def setup_mail
    "ActionMailer::Base.smtp_settings = {
      :address              => 'smtp.gmail.com',
      :port                 => 587,
      :domain               => 'gmail.com',
     :user_name            => 'eabyas.notifier@gmail.com', #Your user name 
      :password             => 'research123', # Your password 
      :authentication       => 'plain',
      :enable_starttls_auto => true
   }"
  end

  def email_controller
    "class EmailController < ApplicationController
  def send_email
    if request.post?
      unless params[:email][:to].nil? or params[:email][:to].blank?
      to_mail=params[:email][:to]
      subject=params[:email][:subject]
      message=params[:email][:message]
      attachment=params[:email][:file]

       unless attachment.nil? and attachment.blank?
      file_name=attachment.original_filename
      dir='/home/harish/september_12/Learning_Rails3/ocean_layout/tmp/uploads/'
      path=File.join(dir,file_name)
      File.open(path,'w+')
      File.open(path, 'wb') { |f| f.write(attachment.read) }

      UserMailer.send_mail(message,to_mail,subject,path,file_name).deliver
      File.delete(path)
      else
      UserMailer.send_mail(message,to_mail,subject,nil,nil).deliver
      end
      flash[:notice]='Email Sent Sucesssfully'
      else
      flash[:notice]='Please enter Email Id..!'
      end
    end
  end
end"
  end

  def send_email_view
    "<%=form_for :email,:html => { :multipart => true } do |f|%>
<table>
<tr><th><h2>Send Email</h2></th></tr>
<tr><td>Mail To</td><td><%=f.text_field :to%></td></tr>
<tr><td>Subject</td><td><%=f.text_field :subject%></td></tr>
<tr><td>Message</td><td><%=f.text_area :message,:rows=>7,:cols=>40%></td></tr>
<tr><td>Attachment</td><td><%=f.file_field :file%></td></tr>
<tr><td colspan='2'><%=f.submit 'Send email'%></td></tr>
</table>
<%end%>
<div id='flash' style='display:none;'>Sending Mail Please Wait..</div>
<%unless flash[:notice].nil?%>
<div id='flash'><%=flash[:notice]%><%flash[:notice]=nil%></div>
<%end%>

<style type='text/css'>
  #flash{
    background:burlywood;
    text-align:center;
    width:800px;
    margin:0px auto;
}
</style>

<script type='text/javascript'>
  $(document).ready(function(){
  $('form').submit(function(){
    $('#flash').css('display','block');
  });
});
</script>"
  end

  def send_mail(message,email,subject,path,file_name)
    if File.file?( "#{Rails.root}/config/initializers/setup_mail.rb" )
    UserMailer.send_mail(message,email,subject,path,file_name).deliver
    else
    self.create_mail
    end
  end
end