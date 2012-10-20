class HomeController < ApplicationController
  def index
    @logged_in = !current_user.nil?
    @user_name = current_user.name unless current_user.nil?
  end
end
