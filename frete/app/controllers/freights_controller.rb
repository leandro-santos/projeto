
class FreightsController < ApplicationController
  def index
  end

  def new
    @freight = Freight.new
  end

  def create
    @freight = Freight.new(params[:freight])
    if @freight.save
      flash[:notice] = 'Sucesso'
      redirect_to new_freights_path
    else
      render :new
    end
  end

  def update
    @freight = Freight.find(params[:id])
    flash[:notice] = 'Sucesso'
  end

  def destroy
    @freight = Freight.find(params[:id])
    @freight.destroy
  end
end