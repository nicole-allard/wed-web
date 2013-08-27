class RegistryController < ApplicationController
  before_filter :authorize_user, :except => :cache

  def update_reservations
    if (!params['item-counts'])
      set_error_message "No items were selected"
      return render "index"
    end
    
    puts "\n\n#{params.inspect}\n\n"
    
    item_counts = Hash[params['item-counts'].split(',').map do |pair|
      pair.split('=').map(&:to_i)
    end]

    # item_counts contains all the items this user wishes to reserve, including
    # previous existing reservations
    
    # First delete any existing reservations that are no longer selected
    user_ids = [@active_user.id]
    user_ids << @active_user.guest.id if @active_user.guest
    existing = RegistryReservation.find_all_by_user_id(user_ids)
    existing.each do |reservation|
      reservation.delete if (!item_counts.has_key?(reservation.registry_item_id))
    end
    
    # Now create or delete reservations based on what was selected
    item_counts.each do |item_id, count|
      existing_item_reservations = existing.select{|r| r.registry_item_id == item_id}
      while (existing_item_reservations.size > count) do
        existing_item_reservations.pop.delete
      end
      while (existing_item_reservations.size < count) do
        existing_item_reservations << RegistryReservation.create!(:user_id => @active_user.id, :registry_item_id => item_id)
      end
    end
    
    set_success_message "Successfully reserved your choices. Thank you!"
    return render "index"
  end
end
