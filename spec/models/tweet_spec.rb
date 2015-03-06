require 'rails_helper'

RSpec.describe Tweet, type: :model do
  context 'Validations' do
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:user_id) }
  end

  context 'Relationship' do
    it 'should belongs to user' do
      user = create :user_with_tweets, password: 'test_password'
      should belong_to(:user)
      #puts user.tweets.as_json
    end
  end
end
