FactoryGirl.define do
  factory :tweet do
    text { Faker::Lorem.paragraph }
    user
  end
end
