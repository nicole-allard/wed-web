class Menu < ActiveRecord::Base
  belongs_to :user
  has_one :entree, :class_name => "MenuItem", :primary_key => :entree_id, :foreign_key => :id
end