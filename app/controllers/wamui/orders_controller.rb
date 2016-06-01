module Wamui
  class OrdersController < BaseController
    def index
      @orders = Order.order(id: :desc)
    end
  end
end
