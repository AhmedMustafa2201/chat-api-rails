Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://redis:6379/0' }
  Sidekiq::Scheduler.dynamic = true
  Sidekiq.schedule = YAML.load_file(File.expand_path('../../sidekiq_scheduler.yml', __FILE__))
  Sidekiq::Scheduler.reload_schedule!
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://redis:6379/0' }
end
