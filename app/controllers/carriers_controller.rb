class CarriersController < ApplicationController

  #menu_item :carriers

  def index
    @carriers = Carrier.all
  end

  def new
    @carriers = Carries.new
  end

  def edit
    @carriers = Carries.find(params[:id])
  end

  def create
    @carriers = Carries.new(params[:carriers])
    flash[:notice] = 'Transportadora cadastradas' if @carriers.save
  end

  def update
    @carriers = Carries.find(params[:id])
    flash[:notice] = 'Transportadora alterada' if @carriers.update_attributes(params[:carriers])
  end

  def destroy
    @carriers = Carries.find(params[:id])
    @carriers.destroy
  end
end