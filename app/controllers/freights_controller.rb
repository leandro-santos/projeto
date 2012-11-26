class FreightsController < ApplicationController

  def index
    @freights = Freight.all
  end

  def new
    @freight = Freight.new
  end

  def edit
    @freight = Freight.find(params[:id])
  end

  def create
    @freight = Freight.new(params[:freight])
    if @freight.save
      flash[:notice] = 'Frete cadastrado'
      redirect_to new_freight_path
    else
      render :action => 'new'
    end
  end

  def update
    @freight = Freight.find(params[:id])
    if @freight.update_attributes(params[:freight])
      flash[:notice] = 'Frete alterado'
      redirect_to freights_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @freight = Freight.find(params[:id])
    @freight.destroy
    redirect_to freights_path
  end
end