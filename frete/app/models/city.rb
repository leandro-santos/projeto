class City < ActiveRecord::Base
  # attr_accessible :title, :body
    validates :name, :city, :presence => true
end
