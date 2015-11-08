class Organization < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships

  def admins
    memberships.select { |m| m.membership_type.to_sym == :admin }.map(&:user)
  end

  def self.balboa
    find_by name: 'Balboa'
  end
end
