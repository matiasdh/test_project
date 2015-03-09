require 'rails_helper'

RSpec.describe UserLikeTweet, type: :model do
  context 'Validations' do
    it { should validate_presence_of(:tweet) }
    it { should validate_presence_of(:user) }
  end

  context 'Relationships' do
    it 'should belongs to user' do
      create :user_like_tweet
      should belong_to(:user)
    end

    it 'should belongs to tweet' do
      create :user_like_tweet
      should belong_to(:tweet)
    end
  end
end
