require 'spec_helper'

describe Cups do

  describe '#all' do
    let (:response) { call_get }
    
    it 'returns all the cups' do
      expect(Cups.all).to eq(response.body)
    end
  end

  describe '#by_name' do
    let (:by_name)  { Cups.by_name('De_Subcategoria2004') }
    let (:response) { call_get(query: 'De_Subcategoria2004') }
    
    it 'returns the cups filtered by name' do
      expect(by_name).to eq(response.body)
    end
  end

  describe '#by_id' do
    let (:by_id)  { Cups.by_name('Cd_CUPS') }
    let (:response) { call_get(query: 'Cd_CUPS') }
    
    it 'returns the cups filtered by cup_id' do
      expect(by_id).to eq(response.body)
    end
  end

  def call_get(params = {})
    Cups::REQUESTS.get '/api/v1/cups', params
  end
end