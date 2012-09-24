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
  end

  def show
  end

  def login
    if request.post?
      @login=User.new(params[:user])
      if authenticate(@login.email,@login.password)
        user=User.find_by_email(@login.email)
         session[:user_id]=user.id
        redirect_to :controller=>"buyer",:action=>"catalog",:mess=>"Welcome..!"
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
