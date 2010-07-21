class AddSurveyQuestionPrice < ActiveRecord::Migration
  def self.up
    add_column :survey_users, :price, :string
    add_column :survey_users, :price_long, :text 
  end
  
  def self.down
    remove_column :survey_users, :price_long
    remove_column :survey_users, :price
  end
end
