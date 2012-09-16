class CreateUserCodes < ActiveRecord::Migration
  def self.up
    create_table :user_codes do |t|
      t.string      :name,        :null => false
      t.string      :code,        :null => false
      t.integer     :user_id,     :null => true
      t.timestamps
    end
  end

  def self.down
    drop_table :user_codes
  end
end
