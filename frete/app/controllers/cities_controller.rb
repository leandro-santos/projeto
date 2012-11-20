class CitiesController < ApplicationController
  def index
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(params[:city])
    if @city.save
      flash[:notice] = 'Sucesso'
      redirect_to new_cities_path
    else
      render :new
    end
  end

  def update
    @city = City.find(params[:id])
    flash[:notice] = 'Sucesso'
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy
  end
end