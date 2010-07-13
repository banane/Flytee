# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_flytee_session',
  :secret      => '6a5838ca4e68bd93b3abeb1ab09c4a55abbdff6dd8913d79be8087b5a338809560dec4764aaace376e109d5c10ea8a06fbe6344570bb205522c77836849afd03'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
