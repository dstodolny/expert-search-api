require "rails_helper"

describe "Users API", kind: :request do
  let(:api_response) { json['data'] }
  let(:user_keys) { %w(name) }

  describe "GET /users" do
    before do
      3.times { create(:user) }
      get "/users"
    end

    it "responds with the correct status" do
      expect(response.status).to eq(200)
    end

    it "returns all users" do
      expect(api_response.length).to eq(3)
    end
  end

  describe "GET /users/:id" do
    let(:user) { create(:user) }

    before do
      get "/users/#{user.id}"
    end

    it "responds with the correct status" do
      expect(response.status).to eq(200)
    end

    it "has the correct keys in the response body" do
      expect(api_response['attributes'].keys).to contain_exactly(*user_keys)
    end
  end

  describe "POST /users" do
    before do
      post "/users", {
        params: {
          data: {
            type: "users",
            attributes: {
              name: "John"
            }
          }
        }
      }
    end

    it "creates a user" do
      expect(response.status).to eq(201)
    end

    it "has the correct keys in the response body" do
      expect(api_response['attributes'].keys).to contain_exactly(*user_keys)
    end
  end
end
