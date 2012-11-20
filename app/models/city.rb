class City < ActiveRecord::Base
  attr_accessible :name, :state
  validates :name, :state, :presence => true
end
