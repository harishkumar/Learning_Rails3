class MiscController < ApplicationController
  def new
    @role=Role.new(params[:role])
    if request.post?
      if @role.save
        @mess="Role Sucessfully Saved"
      end
    end
  end

  def edit
   if request.post?
     @role=Role.find(params[:role][:id])
      if @role.update_attribute(:name,params[:role][:name])
            @mess="Role Sucessfully Updated"
    else
            @mess="Error in Updating Role..!"
    end
    redirect_to :action=>"new"
    end
  end

  def delete_role
    Role.find(params[:id]).destroy
    redirect_to :action=>'new'
  end

  def create_files
    @files=Files.all
    if request.post?
    file_name=params[:my_file][:file_name]
    path="/tmp/harish/#{file_name}.txt"
    file_path="#{Rails.root}"+path
    File.open(file_path,"a+") do |file|
     file << params[:my_file][:content]
     file.close
    end
    Files.create(:name=>file_name,:path=>file_path,:user_id=>session[:user_id])
    @files=Files.all
    end
  end


  def show_file
  @file=Files.find(params[:id])
  @content = IO.readlines(@file.path)
  end

  def delete_file
    @file=Files.find(params[:id])
    File.delete(@file.path)
    @file.destroy
    redirect_to :action=>'create_files'
  end

  def edit_file
    if request.post?
     file_path=params[:my_file][:path]
     File.open(file_path,"w+") do |file|
     file << params[:my_file][:content]
     file.close
    end
    redirect_to :action=>'create_files'
   end
     
  end

  def login
    if request.post?
      @login=User.new(params[:user])
      if authenticate(@login.email,@login.password)
        user=User.find_by_email(@login.email)
         session[:user_id]=user.id
        if user.id==1
        redirect_to :controller=>"users",:action=>"index",:mess=>"Welcome..#{user.name}!"
        elsif user.id==2
        redirect_to :controller=>"products",:action=>"index",:mess=>"Welcome..#{user.name}!"
        else
        redirect_to :controller=>"buyer",:action=>"catalog",:mess=>"Welcome..#{user.name}!"
        end
      else
        @mess="Ener Valid Details"
      end
    end
  end

  def logout
    session[:user_id]=nil
    redirect_to "http://localhost:3000/"
  end
end
