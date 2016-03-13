class OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.order_items.build
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:success] = "Orden creada"
      redirect_to root_path
    else
      flash.now[:error] ="Ups, algo salió mal"
      render :new
    end
  end

  private

  def order_params
    params.require(:order)
          .permit(
            :nombres,
            :email,
            :organizacion,
            :telefono,
            :direccion,
            :direccion_2,
            :observaciones,
            order_items_attributes: [
              :cantidad,
              :unidad,
              :detalle,
              :proveedor,
              :observaciones,
              :_destroy
            ]
          )
  end

  def has_errors?
    @order.errors.any?
  end
  helper_method :has_errors?
end
