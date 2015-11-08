class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization

  def admin?
    membership_type.to_sym == :admin
  end
end
