# config/initializers/secret_token.rb
Rails.application.config.secret_key_base = ENV['SECRET_TOKEN']