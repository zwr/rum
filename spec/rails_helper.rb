ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'devise'
require 'support/controller_macros'
require 'support/request_macros'

ActiveRecord::Migration.maintain_test_schema!

RuboCop::CLI.new.run

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.include Devise::TestHelpers, type: :controller
  config.extend ControllerMacros, type: :controller
  config.extend RequestMacros, type: :request
  config.include Devise::TestHelpers, type: :view
  config.extend ControllerMacros, type: :view
end
