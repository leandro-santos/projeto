class PagesController < ApplicationController
  def index

  end

  def result
    @data = params[:data]
    @result = ValueFreightCarrier.search(@data[:city_origin],@data[:city_destination],@data[:weight])
    #render 'result'
  end
end
