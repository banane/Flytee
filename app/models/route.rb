class Route < ActiveRecord::Base
  has_many :itineraries
  has_many :fare_histories, :through=> :itineraries
end
