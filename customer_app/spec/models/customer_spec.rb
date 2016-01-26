# == Schema Information
#
# Table name: customers
#
#  id           :integer          not null, primary key
#  name         :string
#  email        :string
#  phone        :string
#  mobile_phone :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Customer, type: :model do

  context "Validation" do
    let(:customer) { Customer.new(name: "John") }

    it "must validate presence of email" do
      expect(customer.valid?).to be_falsey
    end

    it "must return email key" do
      customer.valid?
      expect(customer.errors).to have_key(:email)
      expect(customer.errors[:email]).to include "can't be blank"
    end
  end
end
