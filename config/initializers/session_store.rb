# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_viagens_session',
  :secret      => 'f83d0f1c8a9e0d404a180e3a225181ec68b0b8c63bce9926d3a854c955727cc0c68a8d77f6cad158d7ee5c180abc2503d3368dcdf55967e14c62385787d3a0e0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
