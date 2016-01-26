module API
  module V1
    module Manager
      module Customer
        class Customers < Grape::API
          helpers API::V1::Helpers::PermitedParamsHelper

          resource :customers do
            desc 'List Customers'
            get do
              customers = Repositories::Customer.new.all
              present customers, with: API::V1::Manager::Customer::Entities::CustomerPresenter
            end

            desc 'Creating a customer'
            params do
              requires :name, type: String
              requires :email, type: String
              requires :phone, type: String
              requires :mobile_phone, type: String
              optional :address, type: Array do
                requires :street, type: String
                requires :zip_code, type: String
                requires :city_id, type: String
              end
            end
            post do
              Services::CustomerCreator.new(params).create(
                success: -> (customer) {
                  present customer, with: API::V1::Manager::Customer::Entities::CustomerPresenter
                },
                fail: -> (exception) {
                  error!(exception.message)
                }
              )
            end
          end
        end
      end
    end
  end
end
