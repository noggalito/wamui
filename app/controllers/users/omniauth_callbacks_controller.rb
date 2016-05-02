module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      @user = User.from_omniauth(request.env["omniauth.auth"])

      flash[:success] = "Hola #{@user}!"
      sign_in_and_redirect @user, event: :authentication
    end
  end
end
