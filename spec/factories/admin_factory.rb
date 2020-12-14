FactoryBot.define do
  factory :admin do
    email { Faker::Internet.email }
  end
end
