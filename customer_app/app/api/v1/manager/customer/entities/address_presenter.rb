module API
  module V1
    module Customer
      module Entities
        class AddressPresenter < Grape::Entity
          expose :street
          expose :state
          expose :city
          expose :zip_code
        end
      end
    end
  end
end



