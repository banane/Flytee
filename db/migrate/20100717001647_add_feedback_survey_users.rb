class AddFeedbackSurveyUsers < ActiveRecord::Migration
  def self.up
    add_column :survey_users, :feedback, :text
  end

  def self.down
    remove_column :survey_users, :feedback, :text
  end
end
