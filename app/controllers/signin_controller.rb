class SigninController < ApplicationController
  before_filter :sanitize_params

  skip_before_filter :authorize_user

  def login
    puts "\n\n\t\tparams:: #{params.inspect}"
    return redirect_to(:action => 'index') unless params[:code]
    code = params[:code] ? CGI::unescape(params[:code]) : ''

    if(authorize(code))
      redirect_to login_redirect
    else
      set_error_message "Unable to sign you in. Please make sure that you have entered your code correctly. Contact Ken or Nicole to reset or retrieve your code."
      render :action => :index
    end
  end

  private
  
  def authorize(code)
    usercode = UserCode.find_by_code(code)
    puts "\n\n\t\tUSERCODE: #{usercode.inspect}"
    
    if usercode
      if !usercode.user
        # First time logging in. Create user
        user = User.create(:name => usercode.name)
        if (user && user.id)
          cookies[:user_id] = user.id
          @active_user = user
        else
          false
        end
      end
    else
      false
    end
  end

  def login_redirect
    redirect = session[:jumpto] || {:controller => 'home'}
    session[:jumpto] = nil # reset jumpto
    redirect
  end

end
