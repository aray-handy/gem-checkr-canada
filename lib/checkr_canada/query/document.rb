module CheckrCanada
  module Query
    class Document
      module Types
        CONSENT = "consent"
        IDENTIFICATION = "identification"
      end

      def initialize(client = CheckrCanada.config.client)
        @client = client
      end

      def create(candidate_id, type: nil, file_content: nil, content_type: nil)
        document = {
          type: type,
          file_content: file_content,
          content_type: content_type
        }

        @client.post("/ca/v1/candidates/#{candidate_id}/documents", **document)
      end
    end
  end
end
