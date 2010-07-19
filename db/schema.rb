# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100718032034) do

  create_table "citystates", :force => true do |t|
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "flights", :force => true do |t|
    t.text     "from_code"
    t.text     "to_code"
    t.datetime "from_date"
    t.datetime "to_date"
    t.datetime "prebook_date"
    t.integer  "boughtFlag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_users", :force => true do |t|
    t.string   "book_travel"
    t.string   "reason_book"
    t.text     "company_policy"
    t.string   "book_same_day"
    t.text     "why_wait"
    t.text     "problem_long"
    t.text     "resources"
    t.string   "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "feedback"
    t.string   "book_travel_long"
    t.string   "book_same_day_long"
    t.string   "problem_short"
    t.string   "contact_no"
  end

  create_table "test_buttons", :force => true do |t|
    t.string   "button_label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "fname"
    t.string   "lname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "test_button_id"
  end

end
