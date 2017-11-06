require "test_helper"

class CandidateTest < TestCase
  def test_can_create_candidate
    VCR.use_cassette("Query::Candidate#create can successfully create canidate") do
      candidate_query = CheckrCanada::Query::Candidate.new(webclient)
      response = candidate_query.create(
        first_name: "John",
        last_name: "Doe",
        email: "jd@example.com",
        middle_name: "A",
        dob: "1984-03-12",
        phone: "phonenumber",
        birth_country: "CA"
      )

      assert_equal(201, response.status)
    end
  end

  def test_fetch_candidate
    VCR.use_cassette("Query::Candidate#create can successfully retrieve applicant") do
      candidate_query = CheckrCanada::Query::Candidate.new(webclient)
      response = candidate_query.find("3336a9286f8d33f7c10f7692")

      assert_equal(200, response.status)
    end
  end

  def test_update_candidate
    VCR.use_cassette("Query::Candidate#create can successfully update candidate") do
      candidate_query = CheckrCanada::Query::Candidate.new(webclient)

      response = candidate_query.update(
        "3336a9286f8d33f7c10f7692",
        nationality: "IN"
      )

      assert_equal(200, response.status)
      assert_equal("IN", response.body["nationality"])
    end
  end
end
