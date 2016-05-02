module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      @user = User.from_omniauth(request.env["omniauth.auth"])

      flash[:success] = "Hola #{@user}!"
      redirect_to root_path
    end
  end
end
