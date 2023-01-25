# Load the Rails application.
require_relative "application"
# Initialize the Rails application.
Rails.application.initialize!
config.action_view.embed_authenticity_token_in_remote_forms = true