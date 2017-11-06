$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'checkr_canada'

require "vcr"
require "minitest/autorun"

require_relative "test_token" unless ENV["CHECKR_CANADA_TEST_TOKEN"]

VCR.configure do |config|
  config.cassette_library_dir = "test/fixtures/vcr_cassettes"
  config.hook_into :webmock
end

class TestCase < Minitest::Test
   private

  def webclient
    @webclient ||= CheckrCanada::Client.new(ENV["CHECKR_CANADA_TEST_TOKEN"])
  end
end
