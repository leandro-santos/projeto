class City < ActiveRecord::Base
  attr_accessible :name, :city
  validates :name, :city, :presence => true
end
