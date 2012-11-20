class SigninController < ApplicationController
  before_filter :sanitize_params

  skip_before_filter :authorize_user
  
  def login
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
    usercodes = UserCode.find_all_by_code(code).sort_by(&:id)
    
    if !usercodes.empty?
      if !usercodes.first.user
        # First time logging in. Create user(s)
        user = nil
        ActiveRecord::Base.transaction do
          user = User.create(:name => usercodes.first.name)
          usercodes.first.user_id = user.id
          usercodes.first.save!
          if usercodes.length > 1
            guest = User.create(:name => usercodes.last.name)
            usercodes.last.user_id = guest.id
            usercodes.last.save!
            GuestAssoc.create(:user_id => user.id, :guest_id => guest.id)
          end
        end
        

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
