# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :steam, 'A8528EB208703E6E6A4021197B9760FC'
end