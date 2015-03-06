FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    email      { Faker::Internet.email }
    encrypted_password 'encryted_password_hash'

    factory :logged_user do
      after(:create) do |user|
        user.generate_token
      end
    end
  end
end
