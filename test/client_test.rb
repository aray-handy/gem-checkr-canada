require "test_helper"

class ClientTest < TestCase
  def test_get
    VCR.use_cassette("Client#get") do
      client = CheckrCanada::Client.new(ENV["CHECKR_CANADA_TEST_TOKEN"])
      response = client.get("/ca/v1/candidates")

      assert_equal(200, response.status)
    end
  end

  def test_post
    VCR.use_cassette("Client#post") do
      client = CheckrCanada::Client.new(ENV["CHECKR_CANADA_TEST_TOKEN"])
      assert_kind_of(CheckrCanada::Response, client.post("/ca/v1/candidates"))
    end
  end

  def test_post_error
    VCR.use_cassette("Client#post_error") do
      client = CheckrCanada::Client.new(ENV["CHECKR_CANADA_TEST_TOKEN"])
      response = client.post("/ca/v1/candidates")
      assert_equal(400, response.status)
      assert_equal(true, response.error?)
    end
  end

  def test_initialization_has_defaults
    CheckrCanada.configure { |config| config.apikey = "cool" }
    client = CheckrCanada::Client.new
    assert_equal("cool", client.instance_variable_get(:@apikey))
  end
end
