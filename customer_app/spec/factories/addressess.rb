FactoryGirl.define do
  factory :address, class: Address do
    street "123 Street"
    city { FactoryGirl.build(:miami) }
    zip_code "90210"
    customer { FactoryGirl.build(:customer_paul) }
  end

end

