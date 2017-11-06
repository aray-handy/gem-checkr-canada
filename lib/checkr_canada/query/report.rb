module CheckrCanada
  module Query
    class Report
      def initialize(client = CheckrCanada.config)
        @client = client
      end

      def create(candidate_id, package:)
        report = {
          package: package
        }

        @client.post("/ca/v1/candidates/#{candidate_id}/reports", **report)
      end

      def fetch(report_id)
        @client.get("/ca/v1/reports/#{report_id}")
      end
    end
  end
end
