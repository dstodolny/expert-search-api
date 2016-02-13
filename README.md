# Expert Search API
Expert Search is a simple expert search tool that allows you to add and search for experts. The application meets the following specifications:

- You enter a name and a personal website address and an expert is created.
- When an expert is created, all the heading (h1-h3) values are pulled in from the website to that expert profile.
- The website URL is shortened
- After the expert has been added, you can define their connections with other existing experts. Connections are bi-directional i.e. If David is in connection with Oliver, Oliver is always in connection with David as well.
- The interface lists all experts with their name, short URL and the number of connections
- Viewing an actual expert displays the name, website URL, shortening, website headings, and links to their connected experts' pages.
- Looking at someone's profile, you can query for experts in the application who write about a certain topic that are not already in direct connection with the viewed person. Results shows the **path of introduction** from the viewed person to the expert.

*Alan wants to get introduced to someone who writes about 'Dog breeding'. Claudia's website has a heading tag "Dog breeding in Ukraine". Bart knows Alan and Claudia. An example search result would be Alan -> Bart -> Claudia ("Dog breeding in Ukraine").*

## Technology stack

|Dependency|Version|
| -------------|------------------:|
| Rails        | 5.0.0.beta2       |
| Ruby         | 2.3.0             |

## Initial setup
```
git clone git@github.com:dstodolny/expert-search-api.git
cd expert-search-api
cp config/database.example.yml config/database.yml
bundle install
```

## Database
Make sure you have postgress installed and running on your machine.
```
rails db:setup
RAILS_ENV=test rails db:setup
```
You can run seeds for development with `rails db:reseed`.

## URL Shortening
To be able to use the app properly you need to fill `bitly_username` and `bitly_api_key` fields in the `config/secrets.yml` file. If you don't have these keys you need to generate your own *Generic Access Token* [here](https://bitly.com/a/oauth_apps).
```ruby
defaults: &defaults
  bitly_username: <%= ENV["BITLY_USERNAME"] %>
  bitly_api_key: <%= ENV["BITLY_API_KEY"] %>
development:
  <<: *defaults
  secret_key_base: aadfc2307b75b4cd18b7173a0f65f7cfd82bc8c3bb0da35c24334b3fb5c00f85c72ad24d518fc2357d40ab1dadbdca72e926d343b9ba132f696515fb05e0a3fd
test:
  <<: *defaults
  secret_key_base: 8fb2d9510a2aad4466c4ccf58ae9622ba872979c94b100a7b0c2f5b868c7e6580943f8aeff214a4131433b154ac2d9b553a5533ca5f2316fa5fa85ab13c75ee6
production:
  <<: *defaults
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
```

## Running
To launch local HTTP server on port 3000:
```
rails server
```
Make sure to check out the [fronted repo](http://github.com/dstodolny/expert-search.git)

## Tests
To run all tests type:
```
rspec
```
