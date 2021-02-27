module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) || User.new
  end

  def logged_in?
    !current_user.new_record?
  end

end
