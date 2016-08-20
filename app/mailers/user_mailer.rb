class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_needed_email.subject
  #
  def activation_needed_email(user)
    @user = user
    @url = "http://0.0.0.0:3000/users/#{user.activation_token}/activate"

    mail(:to => user.email, :subject => "【MilaaHa】ユーザー認証 確認のお願い")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_success_email.subject
  #
  def activation_success_email(user)
    @user = user
    @url = "http://0.0.0.0:3000/login"

    mail(:to => user.email, :subject => "【MilaaHa】ユーザー認証 完了のお知らせ")
  end

  def reset_password_email(user)
    @user = user
    @url = "http://0.0.0.0:3000" + edit_password_reset_path(@user.reset_password_token)
    mail(:to => user.email,  :subject => "【MilaaHa】パスワードがリセットされました")
  end
end
