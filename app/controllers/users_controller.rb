class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def show
    # get currently logged in user
    # @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params) # Not the final implementation!
    if @user.save
      flash[:success] = "Welcome to the (Unofficial) Up Account Viewer!"
      redirect_to home_path
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password,
                                  :password_confirmation, :access_token)
    end

end
