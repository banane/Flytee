class CreateSurveyUsers < ActiveRecord::Migration
  def self.up
    create_table :survey_users do |t|
      t.string :book_travel
      t.string :reason_book
      t.text :company_policy
      t.string :book_same_day
      t.text :why_wait
      t.text :problem_long
      t.text :resources
      t.string :contact

      t.timestamps
    end
  end

  def self.down
    drop_table :survey_users
  end
end
