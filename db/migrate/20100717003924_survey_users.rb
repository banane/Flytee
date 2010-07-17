class SurveyUsers < ActiveRecord::Migration
  def self.up
    add_column :survey_users, :book_travel_long, :string
    add_column :survey_users, :book_same_day_long, :string
    add_column :survey_users, :problem_short, :string
    add_column :survey_users, :contact_no, :string
  end

  def self.down
    remove_column :survey_users, :book_travel_long
    remove_column :survey_users, :book_same_day_long
    remove_column :survey_users, :problem_short
    remove_column :survey_users, :contact_no
  end
end
