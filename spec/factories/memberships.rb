FactoryGirl.define do
  factory :membership do
    membership_type 'member'
    user nil
    organization nil
  end
end
