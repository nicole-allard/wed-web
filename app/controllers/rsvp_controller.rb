class RsvpController < ApplicationController
  before_filter :authorize_user, :except => :cache
  
  def index
  end

  def update_rsvp
    # TODO
    # check for main user params and call user update
    # check for guest params and call guest update
    redirect_to (:action => index)
  end
end
