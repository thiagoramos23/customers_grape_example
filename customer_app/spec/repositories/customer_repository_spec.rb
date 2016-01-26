require 'rails_helper'

RSpec.describe Repositories::Customer, type: [:repository], fast: false do
  let!(:mark) { create(:customer, name: "Mark") }
  let!(:john) { create(:customer) }
  let(:customer) { attributes_for(:customer_paul) }
  let(:customer_ar) { build(:customer) }

  it "creates a customer with ar passed" do
    expect {
      subject.save_record(customer_ar)
    }.to change(Customer, :count).by 1
  end
  
  it "updates a customer" do
    subject.update_attributes(mark, name: "John")
    expect(Customer.find(mark.id).name).to eq "John"
  end

  it "removes a customer" do
    subject.remove(mark.id)
    expect{ Customer.find(mark.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "lists all customers" do
    expect(subject.all.count).to eq 2
  end
end
