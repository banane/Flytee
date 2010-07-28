class CreateAirports < ActiveRecord::Migration
  def self.up
    create_table :airports do |t|
      t.string :city
      t.string :state_short
      t.string :state_long
      t.string :airport_code

      t.timestamps
    end
  end

  def self.down
    drop_table :airports
  end
end
