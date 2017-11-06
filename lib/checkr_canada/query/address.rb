module CheckrCanada
  module Query
    class Address
      def initialize(client = CheckrCanada.config)
        @client = client
      end

      def create(candidate_id, street1: nil, street2: nil, city: nil, region: nil, country: nil,
                 postal_code: nil, start_date: nil)
        address = {
          street1: street1,
          city: city,
          region: region,
          country: country
        }

        address[:street2] = street2 unless street2.nil?
        address[:postal_code] = postal_code unless postal_code.nil?
        address[:start_date] = start_date unless start_date.nil?

        @client.post("/ca/v1/candidates/#{candidate_id}/addresses", **address)
      end
    end
  end
end
