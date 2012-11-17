require 'factory_girl'

FactoryGirl.define do
  factory :carrier do
    name { Faker::Lorem.paragraph }
    address { Faker::Name.name }
    city { Faker::Address.city }
    zip_code { Faker::Address.zip_code }
    site { Faker::Internet.domain_word }
    phone { Faker::Name.name }
    e_mail { Faker::PhoneNumber.phone_number }
  end
end