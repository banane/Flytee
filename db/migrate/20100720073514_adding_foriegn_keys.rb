class AddingForiegnKeys < ActiveRecord::Migration
  def self.up
    add_column :flights, :user_id, :integer
  end

  def self.down
    remove_column :flights, :user_id
  end
end
