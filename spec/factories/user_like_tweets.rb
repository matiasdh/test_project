FactoryGirl.define do
  factory :user_like_tweet do
    user { create :user }
    tweet { create :tweet }
  end
end
