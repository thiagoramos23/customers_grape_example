module API
  module V1
    module Manager
      module Customer
        class Customers < Grape::API
          helpers API::V1::Helpers::PermitedParamsHelper

          resource :customers do
            desc 'List Customers'
            get do
              customers = ::Customer.all
              present customers, with: API::V1::Manager::Customer::Entities::CustomerPresenter
            end

            desc 'Creating a customer'
            post do
              permited_params = clean_params(params).require(:customer).permit(:name, :email, :phone, :mobile_phone,
                                                                              addresses_attributes:[:street, :city_id, :zip_code])
              created_customer = ::Customer.create!(permited_params)
              present created_customer, with: API::V1::Manager::Customer::Entities::CustomerPresenter
            end

            desc 'Updating a customer'
            put ":id" do
              permited_params = clean_params(params).require(:customer).permit(:name, :email, :phone, :mobile_phone,
                                                                              addresses_attributes:[:street, :city_id, :zip_code])
              customer = ::Customer.find(params[:id])
              customer.update_attributes(permited_params)
              present customer, with: API::V1::Manager::Customer::Entities::CustomerPresenter
            end

            desc 'Removing a customer'
            delete ":id" do
              ::Customer.find(params[:id]).destroy!
            end
          end
        end
      end
    end
  end
end
