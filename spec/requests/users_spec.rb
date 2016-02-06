require "rails_helper"

describe "Users API", kind: :request do
  let(:api_response) { json['data'] }
  let(:user_keys) { %w(name url short_url) }

  describe "GET /users" do
    it "sends a list of users" do
      create_list(:user, 3)

      get "/users"

      expect(response).to be_success
      expect(api_response.length).to eq(3)
    end
  end

  describe "GET /users/:id" do
    it "retrieves a specific user" do
      user = create(:user)

      get "/users/#{user.id}"

      expect(response).to be_success
      expect(api_response["attributes"]["name"]).to eq(user.name)
      expect(api_response["attributes"]["url"]).to eq(user.url)
      expect(api_response["attributes"].keys).to contain_exactly(*user_keys)
    end
  end

  describe "POST /users" do
    it "creates a user" do
      post "/users", {
        params: {
          data: {
            type: "users",
            attributes: {
              name: "John",
              url: "http://example.com"
            }
          }
        }
      }

      expect(response).to have_http_status(:created)
      expect(api_response["attributes"]["name"]).to eq("John")
      expect(api_response["attributes"]["url"]).to eq("http://example.com")
      expect(api_response['attributes'].keys).to contain_exactly(*user_keys)
    end
  end
end
