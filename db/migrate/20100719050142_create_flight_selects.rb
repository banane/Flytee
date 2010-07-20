class CreateFlightSelects < ActiveRecord::Migration
  def self.up
    create_table :flight_selects do |t|
      t.integer :user_id
      t.string :kayak_flight_id
      t.string :search_id

      t.timestamps
    end
  end

  def self.down
    drop_table :flight_selects
  end
end
