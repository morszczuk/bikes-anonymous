FactoryBot.define do
  factory :certificate do
    first_name { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    email { Faker::Internet.email }
    address_line_1 { Faker::Address.street_name }
    address_line_2 { Faker::Address.secondary_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    postcode { Faker::Address.postcode }
    phone { Faker::PhoneNumber.phone_number }
  end
end
