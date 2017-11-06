require "test_helper"

class ReportTest < TestCase
  def test_create_report_successfully
    VCR.use_cassette("Query::Report#create can successfully create report") do
      report_query = CheckrCanada::Query::Report.new(webclient)

      response = report_query.create(
        "3336a9286f8d33f7c10f7692",
        package: "mvr"
      )

      assert_equal(201, response.status)
    end
  end

  def test_fail_to_create_report
    VCR.use_cassette("Query::Report#cannot create report") do
      report_query = CheckrCanada::Query::Report.new(webclient)

      response = report_query.create(
        "3336a9286f8d33f7c10f7692",
        package: "fake package name"
      )

      assert_equal(400, response.status)
    end
  end
end
