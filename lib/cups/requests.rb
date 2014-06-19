module Cups

  require 'yaml'

  # load the yml file with the api url
  API_URL = YAML::load_file(File.join(File.dirname(__FILE__), "yaml/api_url.yml"))

  REQUESTS = Faraday.new(:url => API_URL['api_url']) do |faraday|
    faraday.request  :url_encoded             # form-encode POST params
    faraday.response :logger                  # log requests to STDOUT
    faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
  end
end