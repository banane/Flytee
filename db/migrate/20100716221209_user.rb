class User < ActiveRecord::Migration
  def self.up
    add_column :users, :test_button_id, :integer
  end

  def self.down
  end
end
