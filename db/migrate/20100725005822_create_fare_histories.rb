class CreateFareHistories < ActiveRecord::Migration
  def self.up
    create_table :fare_histories do |t|
      t.datetime :offer_date
      t.integer :itinerary_id
      t.itinerary :route_id
      t.decimal :low_price

      t.timestamps
    end
  end

  def self.down
    drop_table :fare_histories
  end
end
