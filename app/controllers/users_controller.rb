class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def new
	  @user = User.new  	
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
      flash[:success] = "ユーザー登録が完了しました！単語や情報の登録、編集が可能になりました！"
  	  redirect_to @user
  	else
	  render 'new'
  	end
  end

  private
  	def user_params
  	  params.require(:user).permit(:name, :password, :password_confirmation)
  	end
end
