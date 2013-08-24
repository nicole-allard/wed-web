class RegistryItem < ActiveRecord::Base
  attr_accessible :cost, :description, :img, :quantity, :title
  
  has_many :registry_reservations
  
  def num_reserved
    registry_reservations.size
  end
end
