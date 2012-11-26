# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'net/http'
require 'net/https' # for ruby 1.8.7
require 'json'

module BRPopulate
  def self.states
    http = Net::HTTP.new('raw.github.com', 443); http.use_ssl = true
    JSON.parse http.get('/celsodantas/br_populate/master/states.json').body
  end

  def self.populate
    states.each do |state|
      state["cities"].each do |city|
        City.create(:name => city, :state => state["name"])
      end
    end
  end
end

BRPopulate.populate

module CarrierPopulate
  def self.populate
    (0..3).each do |i|
      Carrier.create(name:"Trasportadora#{i}", address:"Rua: Teste#{i}", city_id: City.first.id, zip_code:'16.250-000', site:'www.transportadora.com.br', phone:'(99) 9999-9999', e_mail:'transportadora@yahoo.com')
      Carrier.create(name:"Trasportadora#{i+3}", address:"Rua: Teste#{i+3}", city_id: City.first.id, zip_code:'16.250-000', site:'www.transportadora.com.br', phone:'(99) 9999-9999', e_mail:'transportadora@yahoo.com')
    end
  end
end

CarrierPopulate.populate

module FreightPopulate
  def self.populate
    Freight.create(carrier_id: Carrier.find(1).id, origin_city_id: City.find(1).id, destination_city_id: City.find(3).id, start_weight: '1', end_weight: '10', value: '23')
    Freight.create(carrier_id: Carrier.find(1).id, origin_city_id: City.find(2).id, destination_city_id: City.find(4).id, start_weight: '1', end_weight: '10', value: '21')
    Freight.create(carrier_id: Carrier.find(1).id, origin_city_id: City.find(1).id, destination_city_id: City.find(3).id, start_weight: '11', end_weight: '20', value: '35')
    Freight.create(carrier_id: Carrier.find(1).id, origin_city_id: City.find(2).id, destination_city_id: City.find(4).id, start_weight: '11', end_weight: '20', value: '38')
    Freight.create(carrier_id: Carrier.find(1).id, origin_city_id: City.find(1).id, destination_city_id: City.find(3).id, start_weight: '21', end_weight: '30', value: '42')
    Freight.create(carrier_id: Carrier.find(1).id, origin_city_id: City.find(2).id, destination_city_id: City.find(4).id, start_weight: '21', end_weight: '30', value: '44')
    Freight.create(carrier_id: Carrier.find(1).id, origin_city_id: City.find(1).id, destination_city_id: City.find(3).id, start_weight: '31', end_weight: '40', value: '50')
    Freight.create(carrier_id: Carrier.find(1).id, origin_city_id: City.find(2).id, destination_city_id: City.find(4).id, start_weight: '31', end_weight: '40', value: '51')
    Freight.create(carrier_id: Carrier.find(2).id, origin_city_id: City.find(1).id, destination_city_id: City.find(3).id, start_weight: '1', end_weight: '10', value: '27')
    Freight.create(carrier_id: Carrier.find(2).id, origin_city_id: City.find(2).id, destination_city_id: City.find(4).id, start_weight: '1', end_weight: '10', value: '24')
    Freight.create(carrier_id: Carrier.find(2).id, origin_city_id: City.find(1).id, destination_city_id: City.find(3).id, start_weight: '11', end_weight: '20', value: '34')
    Freight.create(carrier_id: Carrier.find(2).id, origin_city_id: City.find(2).id, destination_city_id: City.find(4).id, start_weight: '11', end_weight: '20', value: '33')
    Freight.create(carrier_id: Carrier.find(2).id, origin_city_id: City.find(1).id, destination_city_id: City.find(3).id, start_weight: '21', end_weight: '30', value: '47')
    Freight.create(carrier_id: Carrier.find(2).id, origin_city_id: City.find(2).id, destination_city_id: City.find(4).id, start_weight: '21', end_weight: '30', value: '44')
    Freight.create(carrier_id: Carrier.find(2).id, origin_city_id: City.find(1).id, destination_city_id: City.find(3).id, start_weight: '31', end_weight: '40', value: '57')
    Freight.create(carrier_id: Carrier.find(2).id, origin_city_id: City.find(2).id, destination_city_id: City.find(4).id, start_weight: '31', end_weight: '40', value: '54')
  end
end

FreightPopulate.populate