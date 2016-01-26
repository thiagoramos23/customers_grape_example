require_relative 'base_validator'

module Validator
  class CustomerValidator < Validator::BaseValidator
    attr_reader :email

    validates :email, presence: true, if: Proc.new {|v| v.scope == :create }

    def initialize args, scope = :create
      super(scope)
      @email = args[:email]
    end
  end
end
