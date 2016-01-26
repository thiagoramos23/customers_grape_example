module API
  module V1
    module Manager
      module Customer
        module Entities
          class AddressPresenter < Grape::Entity
            expose :street
            expose :state_name
            expose :city_name
            expose :zip_code

            def state_name
              object.city.state_name
            end

            def city_name
              object.city.name
            end
          end
        end
      end
    end
  end
end



