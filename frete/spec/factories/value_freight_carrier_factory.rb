require 'factory_girl'

FactoryGirl.define do
  factory :value_freight_carrier, class: 'ValueFreightCarrier' do
    id_carrier { 1 }
    id_origin_city { 1 }
    id_destination_city { 1 }
    beginning_band { 1 }
    end_band { 1 }
    value { 1 }
  end
end