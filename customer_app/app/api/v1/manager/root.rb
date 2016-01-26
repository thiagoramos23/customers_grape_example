module API
  module V1
    module Manager
      class Root < Grape::API
        format :json
        mount API::V1::Manager::Customer::Customers
      end
    end
  end
end

