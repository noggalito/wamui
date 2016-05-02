module Wamui
  class BaseController< ApplicationController
    layout "admin"

    http_basic_authenticate_with(
      name: Rails.application.secrets.admin_username,
      password: Rails.application.secrets.admin_password
    ) unless Rails.env.development?
  end
end
