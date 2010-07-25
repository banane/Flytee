class CreateRoutes < ActiveRecord::Migration
  def self.up
    create_table :routes do |t|
      t.string :origin_code
      t.string :dest_code
      t.integer :rank
      t.integer :pass_per_day
      t.string :carrier_code
      t.decimal :ave_fare

      t.timestamps
    end
  end

  def self.down
    drop_table :routes
  end
end
