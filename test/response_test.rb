require "test_helper"

class ResponseTest < TestCase
  def test_status
    response = CheckrCanada::Response.new(conn.get("hi"))
    assert_equal(200, response.status)
  end

  def test_body
    response = CheckrCanada::Response.new(conn.get("hi"))
    assert_equal({ "id" => "candidate_id" }, response.body)
  end

  def test_no_body
    response = CheckrCanada::Response.new(conn.get("no-content"))
    assert_equal({}, response.body)
  end

  private
  def conn
    @conn ||= Faraday.new do |conn|
      conn.response :raise_error
      conn.adapter :test, stubs
    end
  end

  def stubs
    @stubs ||= Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get("hi") { [200, { "Content-Type" => "application/json" }, %({"id": "candidate_id"})] }
      stub.get("no-content") { [204, { "Content-Type" => "application/json" }, ""] }
    end
  end
end
