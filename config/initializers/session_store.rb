# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_VexelMe_session',
  :secret      => '658e27be423dfe0b0d31ca95a5fe4b5ce677444e51367183b725de922e29b82c734272125b87d53d3a8ab3b3f009a25193f61038a05d4a4575beac80e1df3c33'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
