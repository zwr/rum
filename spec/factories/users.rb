FactoryGirl.define do
  factory :user do
    email 'girl@example.com'
    password 'password'
    password_confirmation 'password'
    memberships { [FactoryGirl.create(:organization)] }
  end
  factory :user2, class: User do
    email 'girl2@example.com'
    password 'password'
    password_confirmation 'password'
    memberships { [FactoryGirl.create(:organization)] }
  end

  factory :admin, class: User do
    email 'admin@factory.girl'
    password 'password'
    password_confirmation 'password'
    memberships { [Membership.new(organization: FactoryGirl.create(:organization), membership_type: :admin)] }
  end

  factory :superadmin, class: User do
    email 'superadmin@factory.girl'
    password 'password'
    password_confirmation 'password'
    memberships { [Membership.new(organization: FactoryGirl.create(:balboa_organization), membership_type: :admin)] }
  end
end
