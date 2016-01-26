FactoryGirl.define do
  factory :new_york_city, class: City do
    name "New York City"
    state { FactoryGirl.build(:new_york) }
  end

  factory :miami, class: City do
    name "Miami"
    state { FactoryGirl.build(:florida) }
  end
end

