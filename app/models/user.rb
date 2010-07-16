class User < ActiveRecord::Base
  belongs_to :testButton, :foreign_key => "test_button_id"
end
