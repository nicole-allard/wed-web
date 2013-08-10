class MenuItem < ActiveRecord::Base
  has_many :entree_menus, :class_name => "Menu", :foreign_key => :entree_id
  has_many :dessert_menus, :class_name => "Menu", :foreign_key => :dessert_id
  has_many :users, :through => :menus
  
  validate :course_validation
  
  def course_validation
    if !MenuItem.courses.values.include?(course)
      errors.add(:course, "This menu item must choose a valid course: " + MenuItem.courses.map{|k,v| "#{k} (#{v})"}.join(', '))
    end
  end
  
  def self.courses
    {:entree => 1, :dessert => 2}
  end
end