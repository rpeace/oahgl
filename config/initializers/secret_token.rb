# config/initializers/secret_token.rb
Rails.Application.config.secret_key_base = ENV['SECRET_TOKEN']