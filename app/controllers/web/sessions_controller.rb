class Web::SessionsController < Web::WebController
  def new
  end

  def login
    user = User.login_by email: params[:data][:email], password: params[:data][:password]
    if user.present?
      session[:session_token] = user.session_token
      redirect_to landing_path
    else
      flash.now[:error_login] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session.delete(:session_token)
    @current_user = nil
    redirect_to login_path
  end
end
