Header.delete_all
User.delete_all

5.times do
  User.create(name: Faker::Name.name, url: Faker::Internet.url)
end

User.all.each do |user|
  5.times do
    Header.create(
      user: user,
      importance: [:h1, :h2, :h3].sample,
      content: Faker::Lorem.sentence
    )
  end
end
