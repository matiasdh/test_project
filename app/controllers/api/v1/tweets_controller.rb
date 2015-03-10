class Api::V1::TweetsController < Api::V1::ApiController
  before_action :load_user_tweet, only: [:update, :destroy]
  before_action :load_tweet, only: [:show, :like, :dislike]
  def index
    @tweets = Tweet.all
  end

  def show
  end

  def create
    @tweet = current_user.tweets.create!(tweet_params)
  end

  def destroy
    @tweet.destroy
    head :no_content
  end

  def update
    @tweet.update!(tweet_params)
  end

  def like
    @tweet.liked_by(@current_user)
    head :no_content
  end

  def dislike
    @tweet.unliked_by(@current_user)
    head :no_content
  end

  private

  def load_user_tweet
    @tweet = current_user.tweets.find params[:id]
  end

  def load_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
