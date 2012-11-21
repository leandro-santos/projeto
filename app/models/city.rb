class City < ActiveRecord::Base
  attr_accessible :name, :state
  validates :name, :state, :presence => true
  has_many :carriers, foreign_key: "city"
  has_many :freigths, foreign_key: "origin_city"
  has_many :freigths, foreign_key: "destination_city"
end
