class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
     flash[:success] = 'Login Successful'
   else
     flash.now[:danger] = 'Invalid Username or Password'
     render 'new'
   end
  end

  def destroy
  end

end
