module API
  module V1
    module Manager
      module Customer
        module Entities
          class CustomerPresenter < Grape::Entity
            expose :id
            expose :name
            expose :phone
            expose :mobile_phone
            expose :email
            expose :addresses, using: API::V1::Manager::Customer::Entities::AddressPresenter
          end
        end
      end
    end
  end
end


