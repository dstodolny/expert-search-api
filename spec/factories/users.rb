FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    url Faker::Internet.url
    short_url Faker::Internet.url
  end
end
