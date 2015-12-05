class Api::UserController < Api::ApiController
  def info
    render json: current_resource_owner
  end

  def logout
    # this should help: http://stackoverflow.com/questions/29208062
    # http://www.jonathanleighton.com/articles/2013/revocable-sessions-with-devise/
    binding.pry
    render json: { message: 'user logged out.' }
  end
end
