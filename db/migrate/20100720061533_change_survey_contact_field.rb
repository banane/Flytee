class ChangeSurveyContactField < ActiveRecord::Migration
  def self.up
    remove_column :contact_no 
    add_column :survey_users, :contact_long, :string
  end

  def self.down
    add_column :survey_users, :contact_long, :string
    remove_column :contact_no 
    
  end
end
