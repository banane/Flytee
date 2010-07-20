class AddOagCodeToCityState < ActiveRecord::Migration
  def self.up
    add_column :citystates, :code, :string
  end

  def self.down
    remove_column :citystates, :code
  end
end
