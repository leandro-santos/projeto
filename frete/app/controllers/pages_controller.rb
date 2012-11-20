class PagesController < ApplicationController
  def index

  end

  def result
    p '---------------------------------------------------------------------------'
    p params[:city_origin]
    p '---------------------------------------------------------------------------'
    p params[:search]
  end

end
