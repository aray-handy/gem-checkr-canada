require "test_helper"

class CriminalRecordTest < TestCase
  def test_creates_criminal_record_successfully
    VCR.use_cassette("Query::CriminalRecord#create can successfully create candidate criminal record") do
      criminal_record_query = CheckrCanada::Query::CriminalRecord.new(webclient)

      response = criminal_record_query.create(
        "3336a9286f8d33f7c10f7692",
        offence: "offence string",
        sentence_date: "2010/01/01",
        location: "nova scotia"
      )
      assert_equal(201, response.status)
    end
  end

  def test_fails_to_create_criminal_record
    VCR.use_cassette("Query::CriminalRecord#cannot create candidate criminal record") do
      criminal_record_query = CheckrCanada::Query::CriminalRecord.new(webclient)

      response = criminal_record_query.create(
        "3336a9286f8d33f7c10f7692",
        offence: "offence string",
        sentence_date: "non date string",
        location: "nova scotia"
      )
      assert_equal(400, response.status)
    end
  end
end
