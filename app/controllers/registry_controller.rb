class RegistryController < ApplicationController
  before_filter :authorize_user, :except => :cache

  def update_reservations
    if (!params['item-counts'])
      set_error_message "No items were selected"
      return render "index"
    end
    
    item_counts = Hash[params['item-counts'].split(',').map do |pair|
      pair.split('=')
    end]

    # item_counts contains all the items this user wishes to reserve, including
    # previous existing reservations
    
    # First delete any existing reservations that are no longer selected
    existing = @active_user.registry_reservations # gets resos for both user and user's guest
    existing.each do |reservation|
      reservation.delete if (!item_counts.has_key?(reservation.registry_item_id))
    end
    
    # Now create or delete reservations based on what was selected
    item_counts.each do |item_id, count|
      existing_item_reservations = existing.keep_if{|r| r.registry_item_id == item}
      while (existing_item_reservations.size > count) do
        existing_item_reservations.pop.delete
      end
      while (existing_item_reservations.size < count) do
        existing_item_reservations << RegistryReservation.create!(:user_id => @active_user.id, :registry_item_id => item_id)
      end
    end
  end
end
