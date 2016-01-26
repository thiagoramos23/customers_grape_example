module Viewmodel
  class CustomerRequest

    def initialize(args)
      @name = args[:name] || ""
      @email = args[:email] || ""
      @phone = args[:phone] || ""
      @mobile_phone = args[:mobile_phone] || ""
      @address = create_address_request(args)
    end

    def to_hash
      {
        name: @name,
        email: @email,
        phone: @phone,
        mobile_phone: @mobile_phone,
        addresses: [@address.to_hash]
      }
    end

    private
    def create_address_request args
      unless args[:address].nil?
        return Viewmodel::AddressRequest.new(args[:address][0] || {})
      end
      return Viewmodel::AddressRequest.new({})
    end
  end
end
