class MenuController < ApplicationController
  before_filter :authorize_user, :except => :cache
  
  def update_menu
    if (!params["user_entree"] || !params["user_dessert"] || (@active_user.guest && (!params["guest_entree"] || !params["guest_dessert"])))
      set_error_message "Missing required menu choices"
      return render "index"
    end
    
    user_menu = update_menu_for_user(@active_user, params["user_entree"].to_i, params["user_dessert"].to_i)
    user_errors = user_menu.errors
    
    guest_errors = {}
    if @active_user.guest
      guest_menu = update_menu_for_user(@active_user.guest, params["guest_entree"].to_i, params["guest_dessert"].to_i)
      guest_errors = guest_menu.errors
    end
    
    if !user_errors.blank? || !guest_errors.blank?
      set_error_message user_errors.values + guest_errors.values
    else
      set_success_message "Successfully updated menu choices"
    end

    render "index"
  end
  
  private
  
  def update_menu_for_user(user, entree_id, dessert_id)
    if (!user.menu)
      Menu.create(:user_id => user.id, :entree_id => entree_id, :dessert_id => dessert_id)
      @active_user = User.find(@active_user.id) # Update @active_user object to have menu association
    else
      user.menu.update_attributes({ :entree_id => entree_id, :dessert_id => dessert_id })
      user.menu
    end
  end
end
