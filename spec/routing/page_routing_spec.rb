require 'spec_helper'

describe 'routing page' do
  it 'routes to #index' do
    get('/').should route_to('pages#index')
  end

  it 'routes to #result(get)' do
    get('/pages/result').should route_to('pages#result')
  end

  it 'routes to #result(post)' do
    post('/pages/result').should route_to('pages#result')
  end

  it 'routes to #more' do
    get('/pages/more/1').should route_to('pages#more', id: "1")
  end
end