5.times do
  User.create(name: Faker::Name.name, url: Faker::Internet.url)
end
