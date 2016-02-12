require "rails_helper"

describe "Friendships API", kind: :request do
  let(:api_response) { json["data"] }
  let(:friendship_keys) { %w(user-id friend-id) }

  describe "GET /friendships" do
    it "sends a list of friendships" do
      create_list(:friendship, 3)

      get "/friendships"

      expect(response).to be_success
      expect(api_response.length).to eq(3)
    end
  end

  describe "GET /friendships/:id" do
    it "retrieves specific friendship" do
      friendship = create(:friendship)

      get "/friendships/#{friendship.id}"

      expect(response).to be_success
      expect(api_response["attributes"]["user-id"]).to eq(friendship.user_id)
      expect(api_response["attributes"]["friend-id"]).to eq(friendship.friend_id)
      expect(api_response["attributes"].keys).to contain_exactly(*friendship_keys)
    end
  end

  describe "POST /friendships" do
    let(:user) { create(:user) }
    let(:friend) { create(:user) }

    it "creates friendship" do
      post "/friendships", {
        params: {
          data: {
            type: "friendships",
            attributes: {
              user_id: user.id,
              friend_id: friend.id
            }
          }
        }
      }

      expect(response).to have_http_status(:created)
      expect(api_response["attributes"]["user-id"]).to eq(user.id)
      expect(api_response["attributes"]["friend-id"]).to eq(friend.id)
    end
  end
end
