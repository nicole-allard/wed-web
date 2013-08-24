class CreateRegistryItems < ActiveRecord::Migration
  def change
    create_table :registry_items do |t|
      t.string :title, :null => false
      t.string :description, :null => false
      t.float :cost, :null => false
      t.integer :quantity, :null => false
      t.string :img, :null => false

      t.timestamps
    end
    
    create_table :registry_reservations do |t|
      t.integer :registry_item_id, :null => false
      t.integer :user_id, :null => false
    end
  end
end
