class Api::UserController < ApplicationController
  before_action :doorkeeper_authorize!

  def info
    render json: User.first
  end
end
