class Carrier < ActiveRecord::Base
  attr_accessible :name, :address, :city, :zip_code, :site, :phone, :e_mail
  validates :name, :presence => true
end
