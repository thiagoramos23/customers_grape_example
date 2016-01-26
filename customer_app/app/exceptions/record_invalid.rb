require_relative 'custom_standard_error'
module Exceptions
  class RecordInvalid < CustomStandardError

    def initialize(args)
      args[:status_code] = 412
      super(args)
    end
  end
end

