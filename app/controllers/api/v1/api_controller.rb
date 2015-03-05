class Api::V1::ApiController < ApplicationController
  before_action :authenticate_user!

  class AuthenticationException < Exception; end

  def authenticate_user!
    @current_user = User.find_by session_token: params[:token]
    raise AuthenticationException unless @current_user
  end

  rescue_from AuthenticationException do |exception|
    render json: exception, status: 401
  end
end
