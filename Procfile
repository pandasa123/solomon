web: bundle exec puma -C config/puma.rb
worker: redis-server && bundle exec sidekiq -q elasticsearch -q mailer -c 3
