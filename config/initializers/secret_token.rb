# config/initializers/secret_token.rb
Dota2rails::Application.config.secret_key_base = ENV['SECRET_TOKEN']