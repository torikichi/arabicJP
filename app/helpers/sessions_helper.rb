module SessionsHelper
  # 与えられたユーザーがログイン済みユーザーであればtrueを返す
  def current_user?(user)
    user == current_user
  end
end
