class CreateMenus < ActiveRecord::Migration
  def self.up
    create_table :menus do |t|
      t.integer     :entree_id,   :null => false
      t.integer     :user_id,     :null => false
      t.timestamps
    end
    
    create_table :menu_items do |t|
      t.string    :title,         :null => false
      t.string    :description,   :null => false
    end
  end

  def self.down
    drop_table :menu_items
    drop_table :menus
  end
end
