require "test_helper"

class ConfigurationTest < TestCase
  def test_api_key
    CheckrCanada.configure do |config|
      config.apikey = "hi im janet"
    end

    assert_equal("hi im janet", CheckrCanada.config.apikey)
  end
end
