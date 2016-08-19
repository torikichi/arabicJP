class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:name], params[:password])
  	  redirect_to root_url
  	else
  	  flash.now[:danger] = 'アカウント名またはパスワードが違います'
  	  render 'new'
  	end
  end

  def destroy
  	logout
  	redirect_to root_url
  end
end
