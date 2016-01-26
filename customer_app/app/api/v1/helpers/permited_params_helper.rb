module API
  module V1
    module Helpers
      module PermitedParamsHelper
        def clean_params(params)
          ActionController::Parameters.new(params)
        end
      end
    end
  end
end
