class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash[:success] = 'Login Successful'
      redirect_to user
    else
      flash.now[:danger] = 'Invalid Username or Password'
      render 'new'
    end
  end

  def destroy
    log_out(@user)
    redirect_to home_path
  end

end
