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

  context 'UserLikeTweets' do
    it 'should has many user_liked_tweets' do
      should have_many(:user_like_tweets)
    end

    it 'should like a tweet' do
      user_a = create :user_with_tweets, password: 'test_password'
      user_b = create :user_with_tweets, password: 'test_password'
      user_a.tweets.first.liked_by(user_b)
      expect(UserLikeTweet.all.count).to be 1
    end

    it 'should like a tweet only once' do
      user_a = create :user_with_tweets, password: 'test_password'
      user_b = create :user_with_tweets, password: 'test_password'

      5.times do |u|
        user_a.tweets.first.liked_by(user_b)
      end
      expect(UserLikeTweet.all.count).to be 1
    end

    it 'should unlike a tweet' do
      user_a = create :user_with_tweets, password: 'test_password'
      user_b = create :user_with_tweets, password: 'test_password'
      user_a.tweets.first.liked_by(user_b)
      user_a.tweets.first.unliked_by(user_b)
      expect(UserLikeTweet.all.count).to be 0
    end

    it 'should not unlike a tweet' do
      user_a = create :user_with_tweets, password: 'test_password'
      user_b = create :user_with_tweets, password: 'test_password'
      expect(user_a.tweets.first.unliked_by(user_b)).to be nil
    end
  end
end
