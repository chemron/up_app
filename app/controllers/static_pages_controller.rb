class StaticPagesController < ApplicationController
  def home
    if logged_in?
      redirect_to accounts_path
    end
  end

end
