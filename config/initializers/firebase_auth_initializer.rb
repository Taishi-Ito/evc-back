FirebaseIdToken.configure do |config|
  config.redis = Redis.new
  config.project_ids = ['evc-project-4b593']
end
