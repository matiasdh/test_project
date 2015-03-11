class Web::WebController < ApplicationController
  before_action :current_user

  private

  def current_user
    @current_user ||= User.find_by session_token: session[:session_token] if session[:session_token]
  end
end
