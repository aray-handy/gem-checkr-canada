module CheckrCanada
  module Query
    class CriminalRecord
      def initialize(client = CheckrCanada.config.client)
        @client = client
      end

      def create(candidate_id, offence: nil, sentence_date: nil, location: nil)
        criminal_record = {
          offence: offence,
          sentence_date: sentence_date,
          location: location
        }

        @client.post("/ca/v1/candidates/#{candidate_id}/criminal_records", **criminal_record)
      end
    end
  end
end
