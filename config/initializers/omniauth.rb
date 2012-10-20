Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :google_oauth2, ENV['MC_GOOGLE_KEY'], ENV['MC_GOOGLE_SECRET'],
           { :scope => 'userinfo.email' }
end