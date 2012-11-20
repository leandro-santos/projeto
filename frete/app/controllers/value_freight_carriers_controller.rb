class ValueFreightCarriersController < ApplicationController
  def index
  end

  def new
    @value_freight_carrier = ValueFreightCarrier.new
  end

  def create
    @value_freight_carrier = ValueFreightCarrier.new(params[:value_freight_carrier])
    if @value_freight_carrier.save
      flash[:notice] = 'Sucesso'
      redirect_to new_value_freight_carriers_path
    else
      render :new
    end
  end

  def update
    @value_freight_carrier = ValueFreightCarrier.find(params[:id])
    flash[:notice] = 'Sucesso'
  end

  def destroy
    @value_freight_carrier = ValueFreightCarrier.find(params[:id])
    @value_freight_carrier.destroy
  end
end