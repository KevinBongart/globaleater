OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Figleaf::Settings.facebook.app_id, Figleaf::Settings.facebook.secret
end
