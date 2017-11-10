require "test_helper"

class DocumentTest < TestCase
  def test_create_document_sucessfully
    VCR.use_cassette("Query::Document#create can successfully create document") do
      document_query = CheckrCanada::Query::Document.new(webclient)
      response = document_query.create(
        "3336a9286f8d33f7c10f7692",
        type: "consent",
        file_content: Base64.encode64((0...2000).map { ('a'..'z').to_a[rand(26)] }.join),
        content_type: "application/pdf"
      )
      assert_equal(201, response.status)
    end
  end
  def test_failed_to_create_document_sucessfully
    VCR.use_cassette("Query::Document#create cannot create document") do
      document_query = CheckrCanada::Query::Document.new(webclient)
      response = document_query.create(
        "3336a9286f8d33f7c10f7692",
        file_content: (0...2000).map { ('a'..'z').to_a[rand(26)] }.join,
        content_type: "application/pdf"
      )
      assert_equal(400, response.status)
    end
  end
end
