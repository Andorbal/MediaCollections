class HomeController < ApplicationController
  def index
    @logged_in = logged_in?
    @user_name = current_user.name unless current_user.nil?
  end
end




