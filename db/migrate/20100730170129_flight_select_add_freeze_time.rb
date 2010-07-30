class FlightSelectAddFreezeTime < ActiveRecord::Migration
  def self.up
    add_column :flight_selects, :freeze_time, :string
  end

  def self.down
    remove_column :flight_selects, :freeze_time
  end
end
