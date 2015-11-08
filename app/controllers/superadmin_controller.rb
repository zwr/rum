class SuperadminController < ActionController::Base
  before_action do
    fail ActionController::RoutingError, 'Not Found' unless user_signed_in? && current_user.superadmin?
  end
end
