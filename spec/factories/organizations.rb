FactoryGirl.define do
  factory :organization do
    name 'MyString'
  end
  factory :balboa_organization, class: Organization do
    name 'Balboa'
  end
end
