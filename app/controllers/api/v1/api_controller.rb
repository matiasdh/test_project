class Api::V1::ApiController < ApplicationController
  before_action :authenticate_user!
  before_action :default_format_json

  class AuthenticationException < Exception; end

  def default_format_json
    request.format = 'json' unless params[:format]
  end

  def authenticate_user!
    @current_user = User.find_by session_token: params[:token] if params[:token]
    raise AuthenticationException unless @current_user
  end

  rescue_from AuthenticationException do |exception|
    render json: exception, status: 401
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: exception, status: 404
  end
end
