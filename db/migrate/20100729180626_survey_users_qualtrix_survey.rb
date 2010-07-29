class SurveyUsersQualtrixSurvey < ActiveRecord::Migration
  def self.up
    add_column :survey_users, :booking_wait, :text
    add_column :survey_users, :research_goals, :text
    add_column :survey_users, :miss_out_fares, :string
  end

  def self.down
    remove_column :survey_users, :booking_wait
    remove_column :survey_users, :research_goals
    remove_column :survey_users, :miss_out_fares
  end
end
