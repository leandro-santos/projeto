class PagesController < ApplicationController
  def index

  end

  def result
    @data = params[:data]
    @freights = Freight.search_type(@data[:origin_city],@data[:destination_city],@data[:weight]).paginate(:page => params[:page], per_page: 3)
  end

end
