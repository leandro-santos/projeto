require 'factory_girl'

FactoryGirl.define do
  factory :freight, class: 'Freight' do
    carrier { Carrier.first }
    origin_city { City.first }
    destination_city { City.first }
    start_weight { "1" }
    end_weight { "10" }
    value { 23 }
  end
end