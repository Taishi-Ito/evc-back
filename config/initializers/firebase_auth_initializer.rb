FirebaseIdToken.configure do |config|
  if Rails.env.production?
    config.redis = Redis.new(url: ENV["REDIS_URL"], ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE })
  else
    config.redis = Redis.new
  end
  config.project_ids = ['evc-project-4b593']
end
