require 'will_paginate/array'
require "will_paginate/version"

class PagesController < ApplicationController
  def index

  end

  def result
    @data = params[:data]
    @freights = search_type(@data[:origin_city],@data[:destination_city],@data[:weight]).paginate(:page => params[:page], per_page: 3)
  end

  private
    def search_type(origin_city, detination_city, weight)
      if weight.blank?
        weight = -1
      end

      case
      when origin_city.present? && detination_city.blank?
        result = Freight.search_by_origin_city(origin_city, weight)
      when detination_city.present? && origin_city.blank?
        result = Freight.search_by_destination_city(detination_city, weight)
      when origin_city.present? && detination_city.present?
        result = Freight.search_all(origin_city, detination_city, weight)
      end

      return result
    end
end
