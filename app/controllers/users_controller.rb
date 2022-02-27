class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def show
    redirect_to accounts_path
  end

  def create
    @user = User.new(user_params) # Not the final implementation!
    if @user.save
      flash[:success] = "Welcome to the (Unofficial) Up Account Viewer!"
      redirect_to accounts_path
    else
      render 'new'
    end
  end

  def accounts
    if !logged_in?
      redirect_to home_path
    else
      @accounts = get_accounts(current_user)
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password,
                                  :password_confirmation, :access_token)
    end

end
