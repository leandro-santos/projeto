#encoding: utf-8
require 'factory_girl'

FactoryGirl.define do
  factory :city, class: 'City'  do
    name { Faker::Address.city }
    state { "São Paulo" }
  end
end