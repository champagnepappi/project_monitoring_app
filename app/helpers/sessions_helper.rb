module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def login(lec)
    session[:lec_id] = lec.id
  end

  def current_user
    if(user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def current_lec
    # Lecturer.find_by(id: session[:user_id])
    if(lec_id = session[:lec_id])
      @current_lec ||= Lecturer.find_by(id: lec_id)
    elsif (lec_id = cookies.signed[:lec_id])
      lec = Lecturer.find_by(id: lec_id)
      if lec && lec.authenticated?(:remember, cookies[:remember_token])
        login lec
        @current_lec = lec
      end
    end
  end

  def current_user?(user)
    if current_user
      user == current_user
    elsif current_lec
      user == current_lec
    end
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def logged_in?
    if current_user
      !current_user.nil?
    elsif current_lec
      !current_lec.nil?
    end
  end

  def log_out
    if current_user
      forget(current_user)
      session.delete(:user_id)
      @current_user = nil
    else
      forget(current_lec)
      session.delete(:lec_id)
      @current_lec = nil
    end
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
