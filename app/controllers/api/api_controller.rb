class Api::ApiController < ActionController::Base
  before_action :doorkeeper_authorize!

  protected

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
