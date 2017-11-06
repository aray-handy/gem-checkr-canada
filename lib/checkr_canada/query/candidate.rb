module CheckrCanada
  module Query
    class Candidate
      def initialize(client = CheckrCanada.config)
        @client = client
      end

      def create(first_name: nil, middle_name: nil, last_name: nil,
                 email: nil, dob: nil, phone: nil, gender: nil, birth_country: nil,
                 birth_place: nil, driver_license_province: nil, driver_license_number: nil,
                nationality: nil, entry_date: nil, custom_id: nil)
        candidate = {
          first_name: first_name,
          last_name: last_name,
          email: email,
          dob: dob,
          phone: phone,
          birth_country: birth_country
        }
        candidate[:middle_name] = middle_name unless middle_name.nil?
        candidate[:gender] = gender unless gender.nil?
        candidate[:birth_place] = birth_place unless birth_place.nil?
        candidate[:driver_license_province] = driver_license_province unless driver_license_province.nil?
        candidate[:driver_license_number] = driver_license_number unless driver_license_number.nil?
        candidate[:nationality] = nationality unless nationality.nil?
        candidate[:entry_date] = entry_date unless entry_date.nil?
        candidate[:custom_id] = custom_id unless custom_id.nil?

        @client.post("/ca/v1/candidates", **candidate)
      end

      def find(candidate_id)
        @client.get("/ca/v1/candidates/#{candidate_id}")
      end

      def update(candidate_id, first_name: nil, middle_name: nil, last_name: nil,
                 email: nil, dob: nil, phone: nil, gender: nil, birth_country: nil,
                 birth_place: nil, driver_license_province: nil, driver_license_number: nil,
                nationality: nil, entry_date: nil, custom_id: nil)
        candidate = {}
        candidate[:first_name] = first_name unless first_name.nil?
        candidate[:last_name] = last_name unless last_name.nil?
        candidate[:email] = email unless email.nil?
        candidate[:dob] = dob unless dob.nil?
        candidate[:phone] = phone unless phone.nil?
        candidate[:birth_country] = birth_country unless birth_country.nil?
        candidate[:middle_name] = middle_name unless middle_name.nil?
        candidate[:gender] = gender unless gender.nil?
        candidate[:birth_place] = birth_place unless birth_place.nil?
        candidate[:driver_license_province] = driver_license_province unless driver_license_province.nil?
        candidate[:driver_license_number] = driver_license_number unless driver_license_number.nil?
        candidate[:nationality] = nationality unless nationality.nil?
        candidate[:entry_date] = entry_date unless entry_date.nil?
        candidate[:custom_id] = custom_id unless custom_id.nil?

        @client.put("/ca/v1/candidates/#{candidate_id}", **candidate)
      end
    end
  end
end
