class AddButtonLabeltoSurvey < ActiveRecord::Migration
  def self.up
    add_column :survey_users, :button_label, :string
  end

  def self.down
    remove_column :survey_users, :button_label
  end
end
