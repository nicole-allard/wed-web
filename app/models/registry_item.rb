class RegistryItem < ActiveRecord::Base
  attr_accessible :cost, :description, :img, :quantity, :title
  
  has_many :registry_reservations
  
  def num_reserved
    registry_reservations.size
  end
  
  def num_reserved_by_user(user)
    return 0 if !user

    user_ids = [user.id]
    user_ids << user.guest.id if user.guest
    registry_reservations.find_all_by_user_id(user_ids).size
  end
  
  def num_available
    quantity - num_reserved
  end
  
  def num_available_to_user(user)
    quantity - num_reserved + num_reserved_by_user(user)
  end
end
