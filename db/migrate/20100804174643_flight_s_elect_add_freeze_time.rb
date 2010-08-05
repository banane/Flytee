class FlightSElectAddFreezeTime < ActiveRecord::Migration
  def self.up
    add_column :flight_selects, :freeze_fee, :string
  end

  def self.down
    remove_column :flight_selects, :freeze_fee
  end
end
