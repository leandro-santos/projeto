require 'spec_helper'

describe City do

  it 'should have a valid generator' do
    FactoryGirl.create(:city).should be_valid
  end

  it 'should have name' do
    FactoryGirl.build(:city, name: nil).should_not be_valid
  end

  it 'should have name' do
    FactoryGirl.build(:city, city: nil).should_not be_valid
  end

end