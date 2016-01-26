require 'rails_helper'

describe Services::CustomerCreator, type:[:services, :customer], fast: true do
  let(:callback) {
    {
      success: -> (customer) {},
      fail: -> (exception){}
    }
  }

  let(:customer_attr) { {name: "John", email: "john@papa.com", phone: "Phone" } }
  let(:subject) { Services::CustomerCreator.new(customer_attr) }
  let(:customer) { double("Customer") }
  let(:repository) { Repositories::Customer }
  let(:repository_instance) { repository.new }
  let(:validator) { Validator::CustomerValidator.new(customer_attr) }
  let(:request_object) { Viewmodel::CustomerRequest.new(customer_attr) }
  let(:permited_attributes) { customer_attr }

  before {
    allow(Viewmodel::CustomerRequest).to receive(:new).and_return(request_object)
    allow(request_object).to receive(:to_hash).and_return(permited_attributes)
    allow(repository).to receive(:new).and_return(repository_instance)
    allow(Validator::CustomerValidator).to receive(:new).and_return(validator)
    allow(repository_instance).to receive(:create).with(customer_attr).and_return(customer)
  }

  context "With valid customer" do
    before {
      allow(validator).to receive(:valid?).and_return(true)
      allow(callback[:success]).to receive(:call)
      subject.create(callback)
    }

    it "creates the repository" do
      expect(repository).to have_received(:new)
    end

    it "delegates the creation to repository" do
      expect(repository_instance).to have_received(:create)
    end
  end

  context "Wiht invalid customer" do
    before {
      allow(validator).to receive(:valid?).and_return(false)
      allow(callback[:fail]).to receive(:call)
      subject.create(callback)
    }

    it "to call fail" do
      expect(callback[:fail]).to have_received(:call)
    end


  end
end
