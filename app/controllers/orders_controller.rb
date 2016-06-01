class OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.order_items.build
    if user_signed_in?
      @order.build_from_current_user!(current_user)
      @order.build_from_last_order_from!(current_user)
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user if user_signed_in?
    if @order.save
      flash[:success] = "Orden creada"
      redirect_to action: :show, id: @order.id
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
            :cedula,
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
