module Exceptions
  class CustomStandardError < StandardError
    attr_reader :status_code, :errors

    def initialize(args)
      super(args[:message])
      @status_code = args[:status_code] if args[:status_code]
      @errors      = args[:errors]
    end

  end
end

