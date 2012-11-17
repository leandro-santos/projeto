require 'spec_helper'

describe 'Carrier' do
  it 'should have a valid generator' do
    #FactoryGirl.create(:carrier).should be_valid
  end

  it 'should have name' do
    #FactoryGirl.build(:game, name: nil).should_not be_valid
  end

  it 'should have description' do
    #FactoryGirl.build(:game, description: nil).should_not be_valid
  end

  it 'developer is not required' do
    #FactoryGirl.build(:game, developer: nil).should be_valid
    #FactoryGirl.build(:game, developer: 'roxio').should be_valid
  end

  it 'slug should be auto generated from bame' do
    #game = FactoryGirl.create(:game, name: 'Mario')
    #game.slug.should == 'mario'
  end

  it 'should have source file' do
    #FactoryGirl.build(:game, source: nil).should_not be_valid
  end

  it 'should be an swf' do
    #thumb = File.open("#{ Rails.root }/spec/support/assets/thumb.png")
    #FactoryGirl.build(:game, source: thumb).should_not be_valid
  end

  it 'should have a thumb' do
    #FactoryGirl.build(:game, thumb: nil).should_not be_valid
  end

  it 'thumb should be an image' do
    #source = File.open("#{ Rails.root }/spec/support/assets/source.swf")
    #FactoryGirl.build(:game, thumb: source).should_not be_valid
  end
end