class ValueFreightCarrier < ActiveRecord::Base
  attr_accessible :id_carrier, :id_origin_city, :id_destination_city, :beginning_band, :end_band, :value
  validates :id_carrier, :id_origin_city, :id_destination_city, :beginning_band, :end_band, :value, :presence => true
end
