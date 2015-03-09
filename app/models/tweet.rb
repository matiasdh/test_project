class Tweet < ActiveRecord::Base
  belongs_to :user

  validates :text,     presence: true
  validates :user_id,  presence: true

  def self.create_tweet(params = {})
    text = params[:text]
    user = param[:user]
    tweet = Tweet.create(text: text, user: user)
  end
end
