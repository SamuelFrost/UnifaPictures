class SessionsController < ApplicationController
  skip_before_action :logged_in_only_page
  def new
  end

  # login
  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
    else
      @login_errors = ['ユーザーIDとパスワードが一致するユーザーが存在しない']
      # use a new user object to check validations from model
      user = User.new({username: params[:session][:username], password: params[:session][:password]})
      user.valid?(:login)
      #filter to only messages about blank fields to prevent exposing unwanted data (:login context already does this as is, but just incase there's changes later)
      validation_errors = user.errors.filter{|error| error.type == :blank}
      @login_errors.concat(validation_errors.map{|error|error.message})
      render 'new'
    end
  end

  # logout
  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end

end
