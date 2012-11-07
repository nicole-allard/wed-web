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
  
  def set_message(messages, message_class)
    flash.now[:notice_messages] ||= {}
    flash.now[:notice_messages][message_class] ||= []
    
    messages = [messages] if messages.is_a? String
    messages.each do |msg|
      flash.now[:notice_messages][message_class] << msg
    end
  end
  
  def set_success_message(messages)
    set_message messages, "success"
  end

  def set_error_message(messages)
    set_message messages, "error"
  end
  
  def check_cookie
    if cookies[:first_visit].blank?
      @first_visit = true
      cookies[:first_visit] = {:value => Time.now, :expires => 10.days.from_now}
    end
  end
end
