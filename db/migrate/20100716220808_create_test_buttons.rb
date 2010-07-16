class CreateTestButtons < ActiveRecord::Migration
  def self.up
    create_table :test_buttons do |t|
      t.string :button_label

      t.timestamps
    end
  end

  def self.down
    drop_table :test_buttons
  end
end
