class City < ActiveRecord::Base
  attr_accessible :name, :state
  validates :name, :state, :presence => true
  has_one :carrier
  has_one :freigth, foreign_key: "origin_city"
  has_one :freigth, foreign_key: "destination_city"
end
