source 'https://rubygems.org'

gem 'rails', github: "rails/rails"

gem 'pg', '~> 0.18'
gem 'puma'

group :development, :test do
  gem 'byebug'
  gem 'rspec', github: 'rspec/rspec'
  gem 'rspec-mocks', github: 'rspec/rspec-mocks'
  gem 'rspec-expectations', github: 'rspec/rspec-expectations'
  gem 'rspec-support', github: 'rspec/rspec-support'
  gem 'rspec-core', github: 'rspec/rspec-core'
  gem 'rspec-rails', github: 'rspec/rspec-rails'
  gem 'factory_girl_rails'
end

group :development do
  gem 'spring'
end

group :test do
  gem 'shoulda-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
