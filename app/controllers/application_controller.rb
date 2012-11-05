class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :check_cookie
  
  def authorize_user
    if cookies[:user_id] && (@active_user.nil? || @active_user.id != cookies[:user_id])
      @active_user = User.find(cookies[:user_id]) rescue nil
    end
    
    unless (@active_user)
      store_location
      redirect_to(:controller => '/signin')
      return false
    end
  end
  
  def store_location
    session[:jumpto] = request.fullpath
  end
  
  #helper function for sanitize_params
  def sanitize_params_rec(val)
    #puts val.inspect
    return if val.frozen? #some parameters are protected - these aren't ones we worry about
    if (val.instance_of?(String))
      sanitized_str = ERB::Util::html_escape(val)
      val.replace(sanitized_str)
    elsif (val.respond_to?("each")) #this should handle any collection within the params hash
      val.each do |*ps|
        subval = ps[-1]
        sanitize_params_rec(subval)
      end
    end
  end

  def sanitize_params
    sanitize_params_rec(params)
  end
  
  def set_message(message_text, message_class)
    if flash.now[:notice_messages] == nil
      flash.now[:notice_messages] = []
    end
    flash.now[:notice_messages] << [message_class, message_text]
  end

  def set_error_message(message_text)
    set_message message_text, "header_notice_error"
  end
  
  def check_cookie
    if cookies[:first_visit].blank?
      @first_visit = true
      cookies[:first_visit] = {:value => Time.now, :expires => 10.days.from_now}
    end
  end
end
