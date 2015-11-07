class Api::ApiController < ActionController::Base
  before_action :doorkeeper_authorize!
end
