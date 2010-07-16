class CreateCitystates < ActiveRecord::Migration
  def self.up
    create_table :citystates do |t|
      t.string :city
      t.string :state

      t.timestamps
    end
  end

  def self.down
    drop_table :citystates
  end
end
