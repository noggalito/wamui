module Wamui
  class BaseController< ApplicationController
    layout "admin"

    before_action :authenticate_user!
    before_action :require_admin!

    private

    def require_admin!
      unless current_user.admin?
        flash[:error] = "necesitas permisos de administración"
        redirect_to(root_path)
      end
    end
  end
end
