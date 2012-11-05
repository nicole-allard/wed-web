class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string      :email,       :default => nil
      t.string      :name,        :null => false
      t.integer     :status,      :default => 2, :limit => 1
      t.timestamps
    end
    
    create_table :guest_assocs do |t|
      t.integer   :user_id
      t.integer   :guest_id
    end
  end

  def self.down
    drop_table :guest_assocs
    drop_table :users
  end
end
