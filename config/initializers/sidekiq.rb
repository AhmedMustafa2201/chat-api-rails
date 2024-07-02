Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://redis:6379/1' }
  Sidekiq::Scheduler.dynamic = true
  Sidekiq.schedule = YAML.load_file(Rails.root.join('config/sidekiq_scheduler.yml'))
  Sidekiq::Scheduler.reload_schedule!
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://redis:6379/1' }
end
