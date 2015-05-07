Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['app_id'], ENV['secret'], {:scope => 'user_about_me,email,read_stream, user_friends'}
end