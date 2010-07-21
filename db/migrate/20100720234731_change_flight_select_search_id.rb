class ChangeFlightSelectSearchId < ActiveRecord::Migration
  def self.up
    remove_column :flight_selects, :search_id
    add_column :flight_selects, :flight_id, :integer
  end

  def self.down
    add_column :flight_selects, :search_id, :varchar
    remove_column :flight_selects, :flight_id
  end
end
