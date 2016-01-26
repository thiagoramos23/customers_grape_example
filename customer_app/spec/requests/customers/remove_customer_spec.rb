require 'rails_helper'

RSpec.describe "Removing Customers", type: [:request, :customer, :api], fast: false do
  context "When removing" do
    let!(:city) { create(:miami, id: 1) }
    let!(:customer_paul) { create(:customer_paul, id: 1) }

    context "return the updated customer" do
      before {
        delete "/api/v1/customers/#{customer_paul.id}"
      }

      it "returns the removed the customer" do
        expect(body["id"]).to eq 1
      end
    end
  end

  def body
    JSON.parse(response.body)
  end
end



