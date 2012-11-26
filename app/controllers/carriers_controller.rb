class CarriersController < ApplicationController

  #menu_item :carriers

  def index
    @carriers = Carrier.all
  end

  def new
    @carrier = Carrier.new
  end

  def edit
    @carrier = Carrier.find(params[:id])
  end

  def create
    @carrier = Carrier.new(params[:carrier])
    if @carrier.save
      flash[:notice] = 'Transportadora cadastrada'
      redirect_to new_carrier_path
    else
      render :action => 'new'
    end
  end

  def update
    @carrier = Carrier.find(params[:id])
    if @carrier.update_attributes(params[:carrier])
      flash[:notice] = 'Transportadora alterada'
      redirect_to carriers_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @carrier = Carrier.find(params[:id])
    @carrier.destroy
    redirect_to carriers_path
  end
end