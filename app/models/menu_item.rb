class MenuItem < ActiveRecord::Base
  has_many :menus, :foreign_key => :entree_id
  has_many :users, :through => :menus
end