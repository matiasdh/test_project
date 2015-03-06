class Api::V1::UsersController < Api::V1::ApiController
  def show
    @user = User.find(params[:id])
  end
end
