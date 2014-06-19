require "faraday"
require "cups/requests"
require "cups/version"

module Cups

  # Public: get resquest to the api cups
  #
  # returns the json response of the cups api 
  def request(query='')
    Cups::REQUESTS.get 'api/v1/cups', { :query => "#{query}" }
  end
  # Public
  #
  # Examples
  #
  #   all() # 
  #   # => [{"cup_id":"S1","name":"Example1"},{"cup_id":"S2","name":"Example2"}]
  #
  # Returns all the CUPS_API data
  def all
    request.body
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
    request(name).body
  end

  # Public
  #
  # Examples
  #
  #   by_id(S2) # 
  #   # => [{"cup_id":"S2","name":"Example2"}]
  #
  # Returns all the CUPS_API data filtered by cup_id
  def by_id(cup_id)
    request(cup_id).body
  end

  module_function :all, :by_name, :by_id, :request
end
