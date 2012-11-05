class RsvpController < ApplicationController
  before_filter :authorize_user, :except => :cache
  
  def index
  end

  def update_rsvp
    @active_user.update_attributes({:email => params["user_email"], :name => params["user_name"], :status => params["user_status"]})
    user_errors = @active_user.errors
    
    guest_errors = {}
    if @active_user.guest
      @active_user.guest.update_attributes({:email => params["guest_email"], :name => params["guest_name"], :status => params["guest_status"]})
      guest_errors = @active_user.guest.errors
    end
    
    if !user_errors.blank? || !guest_errors.blank?
      @errors = user_errors.values + guest_errors.values
    else
      @success = "Successfully updated attendee information"
    end
    
    render "index"
  end
end
