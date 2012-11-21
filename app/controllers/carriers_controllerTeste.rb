class CarriersController < ApplicationController
  def index
  end

  def new
    @carrier = Carrier.new
  end

  def create
    @carrier = Carrier.new(params[:carrier])
    if @carrier.save
      flash[:notice] = 'Sucesso'
      redirect_to new_carriers_path
    else
      render :new
      flash[:notice] = 'Error'
    end
  end

  def update
    @carrier = Carrier.find(params[:id])
    flash[:notice] = 'Sucesso'
  end

  def destroy
    @carrier = Carrier.find(params[:id])
    @carrier.destroy
  end

end