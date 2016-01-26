module API
  module V1
    module Manager
      module Customer
        class Customers < Grape::API
          resource :customers do
            desc 'Managing Customers'

            get do
              customers = ::Customer.all
              present customers, with: API::V1::Manager::Customer::Entities::CustomerPresenter
            end
          end
        end
      end
    end
  end
end
