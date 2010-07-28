class SurveyUsersAddVersionTesting < ActiveRecord::Migration
  def self.up
    add_column :survey_users, :test_version, :string
  end

  def self.down
    drop_column :survey_users, :test_version
  end
end
