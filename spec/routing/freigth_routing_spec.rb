require 'spec_helper'

describe 'routing freigth' do
  it 'routes to #index' do
    get('/freights').should route_to('freights#index')
  end

  it 'routes to #new' do
    get('/freights/new').should route_to('freights#new')
  end

  it 'routes to #create' do
    post('/freights').should route_to('freights#create')
  end

  it 'routes to #update' do
    put('/freights/1').should route_to('freights#update', id: "1")
  end

  it 'routes to #destroy' do
    delete('/freights/1').should route_to('freights#destroy', id: "1")
  end
end