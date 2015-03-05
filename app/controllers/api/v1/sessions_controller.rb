class Api::V1::SessionsController < Api::V1::ApiController
  skip_before_action :authenticate_user!, only: :login

  def login
    user = User.login_by email: params[:email], password: params[:password]
    if user.present?
      render json: { success: true, user: user }
    else
      render json: { success: false, errors: 'Invalid username or password' }, status: 401
    end
  end
end
