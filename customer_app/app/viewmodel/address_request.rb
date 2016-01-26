module Viewmodel
  class AddressRequest

    def initialize(args)
      @street = args[:street] || ""
      @city_id = args[:city_id] || 0
      @zip_code = args[:zip_code] || ""
    end

    def to_hash
      {
        street: @street,
        city_id: @city_id,
        zip_code: @zip_code
      }
    end
  end
end

