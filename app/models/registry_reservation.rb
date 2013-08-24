class RegistryReservation < ActiveRecord::Base
  attr_accessible :registry_item_id, :user_id
  
  belongs_to :registry_item
  belongs_to :user
  
  validate :quantity_validation
  
  def quantity_validation
    cur_registry_item = RegistryItem.find(registry_item_id)
    if cur_registry_item.registry_reservations.length >= cur_registry_item.quantity
      errors.add(:registry_item, "There are no available #{cur_registry_item.title.pluralize} left to reserve.")
    end
  end
end
