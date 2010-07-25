namespace :db do
  require 'active_record'
  desc "Load top routes CSV from sql db into routes model." 
  task :seed_load => :environment do

    puts "loading toproutes"
    ActiveRecord::Base.establish_connection("development")

  
  sql ="insert into routes select null id, origin origin_code,  destination dest_code,  rank rank,   pass_per_day pass_per_day, low_carrier carrier_code,   low_carrier_ave_1way_fare ave_fare, '2010-07-25' created_at, '2010-07-25' updated_at   from toproutes"
  
    ActiveRecord::Base.connection.execute((sql))

  end
end
