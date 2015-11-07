class Api::UserController < Api::ApiController
  def info
    render json: User.first
  end
end
