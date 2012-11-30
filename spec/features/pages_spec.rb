# encoding: utf-8
require 'spec_helper'

describe 'Search for freight' do
  before do
    visit root_path

    page.select('Acrelândia', :from => "Cidade de origem :")
    fill_in 'Peso:', :with => 1
    click_button 'Buscar'
  end

  describe 'query' do
    it 'redirect to the page result' do
      current_path.should == page_result_path
    end
  end

  context 'more' do
    before do
      @freight = FactoryGirl.create(:freight)
      visit freight_profile_path(@freight.id)
    end

    it 'redirects you to the detail page' do
      current_path.should == freight_profile_path(@freight.id)
    end

    it 'should show the name of the carrier' do
      page.should have_content(@freight.carrier.name)
    end
  end

end