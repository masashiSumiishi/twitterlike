class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "パスワードをリセットしました"
      redirect_to root_url
    else
      flash.now[:danger] = "Emailが間違っています"
      render 'new'
    end
  end

  def edit
  end
end
