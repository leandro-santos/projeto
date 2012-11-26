require 'spec_helper'

describe Freight do

it 'should have a valid generator' do
    FactoryGirl.create(:freight).should be_valid
  end

  it 'should have carrier' do
    FactoryGirl.build(:freight, carrier: nil).should_not be_valid
  end

  it 'should have origin_city' do
    FactoryGirl.build(:freight, origin_city: nil).should_not be_valid
  end

  it 'should have destination_city' do
    FactoryGirl.build(:freight, destination_city: nil).should_not be_valid
  end

  it 'should have start_weight' do
    FactoryGirl.build(:freight, start_weight: nil).should_not be_valid
  end

  it 'should have end_weight' do
    FactoryGirl.build(:freight, end_weight: nil).should_not be_valid
  end

  it 'should have value' do
    FactoryGirl.build(:freight, value: nil).should_not be_valid
  end

end
