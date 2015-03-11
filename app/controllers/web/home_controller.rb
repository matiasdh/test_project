class Web::HomeController < Web::WebController
  def welcome
    if @current_user.present?
      redirect_to action: 'landing'
    else
      redirect_to login_path
    end
  end

  def landing
    @tweets = Tweet.take(10)
  end

  def my_tweets
    @tweets = @current_user.tweets.take(10)
    render :landing
  end
end
