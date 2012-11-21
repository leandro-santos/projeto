class Freight < ActiveRecord::Base
  attr_accessible :carrier_id, :origin_city_id, :destination_city_id, :start_weight, :end_weight, :value
  belongs_to :carrier
  belongs_to :destination_city
  belongs_to :origin_city

  validates  :carrier_id, :origin_city_id, :destination_city_id, :start_weight, :end_weight, :value, :presence => true

  scope :search_by_origin_city, lambda{ |origin_city, weight|
    where('origin_city_id = ? AND ((? >= start_weight AND ? <= end_weight) OR ? = -1) ', origin_city, weight, weight, weight)
  }
  scope :search_by_destination_city, lambda{ |destination_city, weight|
    where('destination_city_id = ? AND ((? >= start_weight AND ? <= end_weight) OR ? = -1)', destination_city, weight, weight, weight)
  }
  scope :search_all, lambda{ |origin_city, detination_city, weight|
    where('origin_city_id = ? AND destination_city_id = ? AND ((? >= start_weight AND ? <= end_weight) OR ? = -1) ', origin_city, detination_city, weight, weight, weight)
  }
end
