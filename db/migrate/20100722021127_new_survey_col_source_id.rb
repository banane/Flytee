class NewSurveyColSourceId < ActiveRecord::Migration
  def self.up
    add_column :survey_users, :source, :string
  end

  def self.down
    remove_column :survey_users, :source
  end
end
