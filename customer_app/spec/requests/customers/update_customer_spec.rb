require 'rails_helper'

RSpec.describe "Updating Customers", type: [:request, :customer, :api], fast: false do
  context "When updating" do
    let!(:city) { create(:miami, id: 1) }
    let!(:customer_paul) { create(:customer_paul) }

    context "return the updated customer" do
      before {
        put "/api/v1/customers/#{customer_paul.id}", request_object
      }

      it "the name" do
        expect(body["name"]).to eq "Jack Johnson"
      end
    end
  end

  def request_object
    {
      customer: {
        name: "Jack Johnson",
        email: "paul@newman.com",
      }
    }
  end

  def body
    JSON.parse(response.body)
  end
end


