require 'rails_helper'

RSpec.describe "Adding Customers", type: [:request, :customer, :api], fast: false do
  context "When sendind all the required fields" do
    let!(:city) { create(:miami, id: 1) }

    context "return the created customer" do
      before {
        post "/api/v1/customers", request_object
      }

      it "with name" do
        expect(body["name"]).to eq "Jack Johnson"
      end

      it "with email" do
        expect(body["email"]).to eq "jack@johnson.com"
      end

      it "with address" do
        address = body["addresses"]
        expect(address.count).to eq 1
        expect(address[0]["street"]).to eq "Main Street"
        expect(address[0]["city_name"]).to eq "Miami"
      end
    end

  end

  context "Without email" do

    before {
      customer = request_object
      customer[:customer].delete(:email)
      post "/api/v1/customers", customer
    }

    it "must return a key with error_message" do
      expect(body).to have_key("response_type")
      expect(body["response_type"]).to eq "error"
      expect(body["message"]).to include "Email can't be blank"
    end
  end

  def request_object
    {
      customer: {
        name: "Jack Johnson",
        email: "jack@johnson.com",
        phone: "12332231233",
        mobile_phone: "8898438344",
        addresses_attributes: [
          {
            street: "Main Street",
            city_id: 1,
            zip_code: "90210"
          }
        ]
      }
    }
  end

  def body
    JSON.parse(response.body)
  end
end

