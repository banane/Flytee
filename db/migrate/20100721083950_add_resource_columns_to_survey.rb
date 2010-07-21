class AddResourceColumnsToSurvey < ActiveRecord::Migration
  def self.up
    add_column :survey_users, :res_expedia, :string
    add_column :survey_users, :res_bing, :string
    add_column :survey_users, :res_farecast, :string
    add_column :survey_users, :res_kayak, :string
    add_column :survey_users, :res_momondo, :string
    add_column :survey_users, :res_orbitz, :string
    add_column :survey_users, :res_travelocity, :string
    
  end

  def self.down
    remove_column :survey_users, :res_expedia
    remove_column :survey_users, :res_bing
    remove_column :survey_users, :res_farecast
    remove_column :survey_users, :res_kayak
    remove_column :survey_users, :res_momondo
    remove_column :survey_users, :res_orbitz
    remove_column :survey_users, :res_travelocity
  end
end
