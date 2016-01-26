module Viewmodel
  class CustomerRequest

    def initialize(args)
      @name = args[:name] || ""
      @email = args[:email] || ""
      @phone = args[:phone] || ""
      @mobile_phone = args[:mobile_phone] || ""
      @address = Viewmodel::AddressRequest.new(args[:address][0] || {})
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
  end
end
