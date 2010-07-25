namespace :db do
  require 'active_record'
  desc "Load top routes CSV from sql db into routes model." 
  task :seed_load => :environment do

    # wonder if should load csvs...	

    puts "loading toproutes"
    ActiveRecord::Base.establish_connection("development")

  
  sql ="insert into routes select distinct null id, am.code origin_code,  am2.code dest_code,  rank rank,   pass_per_day pass_per_day, low_carrier carrier_code,   ' low_fare' ave_fare, '2010-07-25' created_at, '2010-07-25' updated_at from toproutes_latest_csv tr, airportmaster am, airportmaster am2 where tr.origin_city = am.city and tr.origin_state = am.state_long and tr.dest_city = am2.city and tr.dest_state = am2.state_long"
  
    ActiveRecord::Base.connection.execute((sql))
    
    puts "toproutes loaded"


  end
  
  task :seed_dump => :environment do
      ActiveRecord::Base.establish_connection("development")

  
    sql ="delete from routes"
  
    ActiveRecord::Base.connection.execute((sql))
    
    puts "toproutes truncated"
  end
end
