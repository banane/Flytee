class Itinerary < ActiveRecord::Base
  belongs_to :route
  has_many :fare_histories
end
