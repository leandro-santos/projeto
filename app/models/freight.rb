class Freight < ActiveRecord::Base
  attr_accessible :carrier_id, :origin_city_id, :destination_city_id, :start_weight, :end_weight, :value
  belongs_to :carrier
  belongs_to :destination_city, :class_name => 'City'
  belongs_to :origin_city, :class_name => 'City'

  validates  :carrier_id, :origin_city_id, :destination_city_id, :start_weight, :end_weight, :value, :presence => true

  scope :search_by_origin_city, lambda{ |origin_city, weight|
    where(origin_city_id: origin_city).
    where('((? >= start_weight AND ? <= end_weight) OR ? = -1) ', weight, weight, weight)
  }
  scope :search_by_destination_city, lambda{ |destination_city, weight|
    where(destination_city_id: destination_city).
    where('((? >= start_weight AND ? <= end_weight) OR ? = -1)', weight, weight, weight)
  }
  scope :search_all, lambda{ |origin_city, detination_city, weight|
    where(origin_city_id: origin_city).where(destination_city_id: detination_city).
    where('((? >= start_weight AND ? <= end_weight) OR ? = -1)', weight, weight, weight)
  }
  scope :search_table, lambda{ |weight|
    where('((? >= start_weight AND ? <= end_weight) OR ? = -1)', weight, weight, weight)
  }

  def self.search_type(origin_city, detination_city, weight)
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
    else
      result = Freight.search_table(weight)
    end

    return result
  end

end
