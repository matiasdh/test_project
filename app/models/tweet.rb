class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :user_like_tweets
  has_many :users, through: :user_like_tweets

  validates :text,     presence: true
  validates :user_id,  presence: true

  def liked_by(user)
    user_like_tweets.create user_id: user.id unless user_like_tweets.exists? user_id: user.id
  end

  def unliked_by(user)
    to_delete = user_like_tweets.find_by user_id: user.id
    to_delete.destroy
  end
end
