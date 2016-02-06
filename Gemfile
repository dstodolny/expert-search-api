source 'https://rubygems.org'

gem 'rails', github: "rails/rails"
gem 'active_model_serializers', github: "rails-api/active_model_serializers"
gem 'decent_exposure', github: "hashrocket/decent_exposure"
gem "validate_url"
gem "mechanize"
gem "bitly"

gem 'pg', '~> 0.18'
gem 'puma'

group :development, :test do
  gem 'pry'
  gem 'rspec', github: 'rspec/rspec'
  gem 'rspec-mocks', github: 'rspec/rspec-mocks'
  gem 'rspec-expectations', github: 'rspec/rspec-expectations'
  gem 'rspec-support', github: 'rspec/rspec-support'
  gem 'rspec-core', github: 'rspec/rspec-core'
  gem 'rspec-rails', github: 'rspec/rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :development do
  gem 'spring'
end

group :test do
  gem 'shoulda-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
