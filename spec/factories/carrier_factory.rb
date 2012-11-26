require 'factory_girl'

FactoryGirl.define do
  factory :carrier, class: 'Carrier' do
    name { Faker::Name.name }
    address { Faker::Address.name }
    city { City.first }
    zip_code { "16.250-000" }
    site { Faker::Internet.domain_word }
    phone { Faker::Name.name }
    e_mail { Faker::PhoneNumber.phone_number }
  end
end