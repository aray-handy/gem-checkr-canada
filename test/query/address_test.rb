require "test_helper"

class AddressTest < TestCase
  def test_create_address
    VCR.use_cassette("Query::Address#create can successfully create candidate address") do
      address_query = CheckrCanada::Query::Address.new(webclient)

      response = address_query.create(
        "3336a9286f8d33f7c10f7692",
        street1: "street1",
        street2: "street2",
        city: "Montreal",
        country: "CA",
        region: "QC",
        postal_code: "postal_code",
        start_date: "2017/01/19"
      )

      assert_equal(201, response.status)
    end
  end

  def test_fails_to_create_address
    VCR.use_cassette("Query::Address#cannot create candidate address") do
      address_query = CheckrCanada::Query::Address.new(webclient)

      response = address_query.create(
        "3336a9286f8d33f7c10f7692",
        street1: "street1",
        country: "CA",
      )

      assert_equal(400, response.status)
    end
  end
end
