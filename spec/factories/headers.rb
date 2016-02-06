FactoryGirl.define do
  factory :header do
    user
    importance [:h1, :h2, :h3].sample
    content Faker::Lorem.sentence

    trait :h1 do
      importance :h1
    end

    trait :h2 do
      importance :h2
    end

    trait :h3 do
      importance :h3
    end
  end
end
