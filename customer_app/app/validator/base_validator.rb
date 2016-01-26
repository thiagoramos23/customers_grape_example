require 'active_model'

module Validator
  class BaseValidator
    include ActiveModel::Validations

    attr_reader :scope

    def initialize(scope = :create)
      @scope = scope
    end

    def full_message
      errors.messages
    end
  end
end

