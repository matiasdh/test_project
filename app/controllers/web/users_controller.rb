class Web::UsersController < Web::WebController

  # GET /web/users/new
  def new
    @user = User.new
  end

  # POST /web/users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_path , notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
