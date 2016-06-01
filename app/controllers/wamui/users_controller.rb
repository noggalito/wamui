module Wamui
  class UsersController < BaseController
    def index
      @users = User.all
    end

    def admin
      @user = User.find(params[:id])
      @user.toggle!(:admin) unless @user == current_user
      redirect_to action: :index
    end
  end
end
