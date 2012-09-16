class RsvpController < ApplicationController
  before_filter :authorize_user, :except => :cache
  
  def index
  end
end
