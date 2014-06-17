require "cups/version"

module Cups

  requests = Faraday.new(:url => 'http://localhost:3000/api/v1') do |faraday|
    faraday.request  :url_encoded             # form-encode POST params
    faraday.response :logger                  # log requests to STDOUT
    faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
  end
  # Internal
  #
  # Examples
  #
  #   all() # 
  #   # => [{"cup_id":"S1","name":"Example1"},{"cup_id":"S2","name":"Ezxample2"}]
  #
  # Returns all the CUPS_API data
  def all
    requests.get '/cups'
  end

  # Internal
  #
  # Examples
  #
  #   by_name(Example1) # 
  #   # => [{"cup_id":"S1","name":"Example1"}]
  #
  # Returns all the CUPS_API data filtered by name
  def by_name(name)
    requests.get '/cups', { :query => "#{name}" }
  end

  # Internal
  #
  # Examples
  #
  #   by_id(S2) # 
  #   # => [{"cup_id":"S2","name":"Ezxample2"}]
  #
  # Returns all the CUPS_API data filtered by cup_id
  def by_id(cup_id)
    requests.get '/cups', { :query => "#{cup_id}" }
  end
end
