module API
  module V1
    module Manager
      module Customer
        class Customers < Grape::Api
          resource :customers do
            desc 'Managing Customers'

            get do

            end
          end

        end
      end
    end
  end
end
