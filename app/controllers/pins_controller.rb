class PinsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pins = Pin.all.order('created_at DESC')
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def new
    @pin = Pin.new
  end

  def create
    pin = Pin.new(pin_params)
    pin.user = current_user
    if pin.save
      redirect_to pin, notice: "El pin fue creado exitosamente"
    else
      render :new
    end
  end

  private
    def pin_params
      params.require(:pin).permit(:title, :description)
    end
end
