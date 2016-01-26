module Repositories
  class Customer < Repositories::BaseRepository
    model_name "customer"

    def create params
      address_params = params.delete(:addresses)
      address = Address.new(address_params[0]) unless address_params[0].present?
      customer = ::Customer.new(params)
      customer.addresses.push(address) unless address.nil?
      save_record customer
      customer
    end
  end
end
