FactoryGirl.define do
  factory :tweet do
    text { Faker::Lorem.paragraph }
    user { create :user }
  end
end
