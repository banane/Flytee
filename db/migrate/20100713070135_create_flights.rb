class CreateFlights < ActiveRecord::Migration
  def self.up
    create_table :flights do |t|
      t.text :from_code
      t.text :to_code
      t.datetime :from_date
      t.datetime :to_date
      t.datetime :prebook_date
      t.integer :boughtFlag

      t.timestamps
    end
  end

  def self.down
    drop_table :flights
  end
end
