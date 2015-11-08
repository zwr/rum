class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :memberships
  has_many :organizations, through: :memberships

  def owned_organizations
    memberships.select { |m| m.membership_type.to_sym == :admin }.map(&:organization)
  end

  def administers?(organization)
    return true if superadmin?
    organization = Organization.find_by name: organization.capitalize unless organization.is_a? Organization
    owned_organizations.include? organization
  end

  def superadmin?
    owned_organizations.include? Organization.balboa
  end
end
