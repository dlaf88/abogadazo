require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'csv' #this was added for the purpose of crawling 
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Abogadazo
  class Application < Rails::Application
     config.active_job.queue_adapter = :sidekiq
  end
end
