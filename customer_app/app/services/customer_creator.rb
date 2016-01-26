module Services
  class CustomerCreator

    def initialize(params)
      @request_object = Viewmodel::CustomerRequest.new(params)
      @repo = Repositories::Customer.new
      @validator = Validator::CustomerValidator.new(params)
    end

    def create(block)
      begin
        params = @request_object.to_hash
        customer_validator = Validator::CustomerValidator.new(params)
        raise Exceptions::RecordInvalid.new(message: customer_validator.full_message) unless customer_validator.valid?
        customer = @repo.create(params)
        block[:success].call(customer)
      rescue Exception => e
        block[:fail].call(e)
      end
    end
  end
end
