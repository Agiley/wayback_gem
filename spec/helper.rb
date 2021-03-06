require 'simplecov'
require 'coveralls'
Coveralls.wear!

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start

require 'wayback'
require 'wayback/identity_map'
require 'rspec'
require 'stringio'
require 'tempfile'
require 'timecop'
require 'webmock/rspec'

WebMock.disable_net_connect!(:allow => 'coveralls.io')

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def a_delete(path)
  a_request(:delete, Wayback::Default::ENDPOINT + Wayback::Default::ENDPOINT_PATH + path)
end

def a_get(path)
  a_request(:get, Wayback::Default::ENDPOINT + Wayback::Default::ENDPOINT_PATH + path)
end

def a_post(path)
  a_request(:post, Wayback::Default::ENDPOINT + Wayback::Default::ENDPOINT_PATH + path)
end

def a_put(path)
  a_request(:put, Wayback::Default::ENDPOINT + Wayback::Default::ENDPOINT_PATH + path)
end

def a_json_get(path)
  a_request(:get, Wayback::Default::JSON_ENDPOINT + Wayback::Default::JSON_ENDPOINT_PATH + path)
end

def stub_delete(path)
  stub_request(:delete, Wayback::Default::ENDPOINT + Wayback::Default::ENDPOINT_PATH + path)
end

def stub_get(path)
  stub_request(:get, Wayback::Default::ENDPOINT + Wayback::Default::ENDPOINT_PATH + path)
end

def stub_post(path)
  stub_request(:post, Wayback::Default::ENDPOINT + Wayback::Default::ENDPOINT_PATH + path)
end

def stub_put(path)
  stub_request(:put, Wayback::Default::ENDPOINT + Wayback::Default::ENDPOINT_PATH + path)
end

def stub_json_get(path)
  stub_request(:get, Wayback::Default::JSON_ENDPOINT + Wayback::Default::JSON_ENDPOINT_PATH + path)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
