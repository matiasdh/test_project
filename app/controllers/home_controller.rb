class HomeController < ApplicationController
  def landing
    @tweets = Tweet.take(10)
  end
end
