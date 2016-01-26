require 'rails_helper'

RSpec.describe "Listing All Customers", type: [:request, :customer, :api], fast: false do
  let(:paul) { create(:customer_paul) }
  let(:john) { create(:customer, name: "John Lennon", email: "john@lennon.com")}
  let!(:address_john) { create(:address, customer: john) }
  let!(:address) { create(:address, customer: paul) }

  context "When calling /customers endpoint" do
    before {
      get "/api/v1/customers"
    }

    it "lists all customers" do
      expect(body.count).to eq 2
    end

    it "has all the keys" do
      result = body[0]
      verify_keys_for(result)
    end

    it "has same name" do
      result = body[0]
      expect(result["name"]).to eq john.name
    end

    def body
      JSON.parse(response.body)
    end

    def verify_keys_for(json)
      expect(json).to have_key("name").and have_key("phone").and have_key("mobile_phone").and have_key("addresses")
    end
  end
end
