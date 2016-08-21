class UsersController < ApplicationController
  before_action :correct_user, only: [:show]
  before_action :admin_user, only: [:index, :destroy]
  has_paper_trail

  def show
  	@user = User.find(params[:id])
  end

  def index
    @users = User.all.page(params[:page])
  end

  def new
	  @user = User.new
    @user.email = ""
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  	  redirect_to @user
  	else
	    render 'new'
  	end
  end

  def destroy
    User.find_by(params[:id]).destroy
    flash[:success] = "ユーザーが削除されました。"
    redirect_to users_path
  end

  # メールアクティベーション
  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(login_path, :notice => 'ユーザー認証が完了しました。')
    else
      not_authenticated
    end
  end

  private
  	def user_params
  	  params.require(:user).permit(:name, :email, :password, :password_confirmation)
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
