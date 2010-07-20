class Flight < ActiveRecord::Base

  validates_presence_of :from_code
  validates_presence_of :to_code
  validates_presence_of :from_date
  validates_presence_of :to_date
  
end
