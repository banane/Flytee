class CreateItineraries < ActiveRecord::Migration
  def self.up
    create_table :itineraries do |t|
      t.datetime :dept_date
      t.datetime :ret_date
      t.integer :route_id

      t.timestamps
    end
  end

  def self.down
    drop_table :itineraries
  end
end
