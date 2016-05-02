module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      @user = User.from_omniauth(request.env["omniauth.auth"])

      flash[:success] = "Hola #{@user}!"
      sign_in_and_redirect @user, event: :authentication
    end

    private

    def new_session_path(scope)
      root_path
    end
  end
end
