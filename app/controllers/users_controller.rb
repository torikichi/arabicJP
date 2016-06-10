class UsersController < ApplicationController
  #before_action 

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

    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
