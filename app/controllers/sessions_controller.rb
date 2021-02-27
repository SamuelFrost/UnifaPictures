class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
    else
      @login_errors = ['ユーザーIDとパスワードが一致するユーザーが存在しない']
      user = User.new({username: params[:session][:username], password: params[:session][:password]})
      user.valid?
      @login_errors.concat(user.errors.map{|error|error.message})
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end

end
