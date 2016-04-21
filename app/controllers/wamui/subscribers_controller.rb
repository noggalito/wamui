module Wamui
  class SubscribersController < ApplicationController
    before_action :find_subscriber,
                  only: [ :edit, :update, :destroy ]

    def index
      @subscribers = Subscriber.order(:id)
    end

    def new
      @subscriber = Subscriber.new
    end

    def edit
    end

    def create
      @subscriber = Subscriber.new(subscriber_params)
      if @subscriber.save
        flash[:success] = "yay!"
        redirect_to action: :index
      else
        flash[:error] = "ups!"
        render :new
      end
    end

    def update
      if @subscriber.update(subscriber_params)
        flash[:success] = "yay!"
        redirect_to action: :index
      else
        flash[:error] = "ups!"
        render :edit
      end
    end

    def destroy
      @subscriber.destroy
      flash[:success] = "usuario eliminado!"
      redirect_to action: :index
    end

    private

    def find_subscriber
      @subscriber = Subscriber.find(params[:id])
    end

    def subscriber_params
      params.require(:wamui_subscriber)
            .permit :email, :slack
    end
  end
end
