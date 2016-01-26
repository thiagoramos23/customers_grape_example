module API
  module V1
    module Customer
      module Entities
        class CustomerPresenter < Grape::Entity
          expose :id
          expose :name
          expose :phone
          expose :mobile_phone
          expose :email
          expose :address, using: API::V1::Customer::Entities::AddressPresenter
        end
      end
    end
  end
end


