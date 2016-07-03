web: bin/rails server -p $PORT -e $RAILS_ENV
worker: bundle exec rake jobs:work
worker_2: bundle exec sidekiq -C config/sidekiq.yml

