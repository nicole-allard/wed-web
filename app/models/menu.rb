class Menu < ActiveRecord::Base
  belongs_to :user
  has_one :entree, :class_name => "MenuItem", :primary_key => :entree_id, :foreign_key => :id
  has_one :dessert, :class_name => "MenuItem", :primary_key => :dessert_id, :foreign_key => :id
  
  validate :course_validation
  
  def course_validation
    if (MenuItem.find(entree_id).course != MenuItem.courses[:entree] rescue true)
      errors.add(:entree, "The entree must be one of the valid entrees: #{MenuItem.find_all_by_course(MenuItem.courses[:entree]).map(&:title).join(', ')}")
    end
    if (MenuItem.find(dessert_id).course != MenuItem.courses[:dessert] rescue true)
      errors.add(:dessert, "The dessert must be one of the valid desserts: #{MenuItem.find_all_by_course(MenuItem.courses[:dessert]).map(&:title).join(', ')}")
    end
  end
end