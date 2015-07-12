class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      login user
      redirect_to root_url, notice: 'ログインしました'
    else
      flash.alert = 'ログイン名またはパスワードが正しくありません。'
      render 'new'
    end
  end

  def destroy
  end
end
