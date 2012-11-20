class PagesController < ApplicationController
  def index

  end

  def result
    @data = params[:data]
    @result = ValueFreightCarrier.search(@data[:origin_city],@data[:destination_city],@data[:weight])
    #render 'result'
  end
end
