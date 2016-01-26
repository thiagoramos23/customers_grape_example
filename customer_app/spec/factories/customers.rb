FactoryGirl.define do
  factory :customer_paul, class: Customer do
    name "Paul"
    email "paul@newman.com"
    phone "432-433-4424"
    mobile_phone "323-4244-2433"
  end

  factory :customer, parent: :customer_paul do
    name "John"
    email "john@lennon.com"
  end
end

