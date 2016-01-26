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
      verify_keys_for(result(0))
    end

    it "has same name" do
      expect(result(0)["name"]).to eq john.name
    end

    it "has same email" do
      expect(result(0)["email"]).to eq john.email
    end

    it "has same phone" do
      expect(result(0)["phone"]).to eq john.phone
    end

    it "has same mobile phone" do
      expect(result(0)["mobile_phone"]).to eq john.mobile_phone
    end

    it "has one address" do
      addressess = result(0)["addresses"]
      expect(addressess.count).to eq 1
    end

    it "has same address" do
      addressess = result(0)["addresses"]
      john_address = john.addresses[0]
      expect(addressess[0]["zip_code"]).to eq john_address.zip_code
      expect(addressess[0]["city_name"]).to eq john_address.city.name
      expect(addressess[0]["state_name"]).to eq john_address.city.state_name
      expect(addressess[0]["street"]).to eq john_address.street
    end

    def result index
      body[index]
    end

    def body
      require 'pry'; binding.pry
      JSON.parse(response.body)
    end

    def verify_keys_for(json)
      expect(json).to have_key("name").and have_key("phone").and have_key("mobile_phone").and have_key("addresses")
    end
  end
end
