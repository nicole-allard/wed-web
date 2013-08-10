class AddToMenus < ActiveRecord::Migration
  def self.up
    add_column :menus, :dessert_id, :integer
    change_column :menus, :dessert_id, :integer, :null => false
    add_column :menu_items, :course, :integer
    change_column :menu_items, :course, :integer, :null => false
  end

  def self.down
    remove_column :menus, :dessert_id
    remove_column :menu_items, :course
  end
end
