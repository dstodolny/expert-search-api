require "rails_helper"

describe "Headers API", kind: :request do
  let(:api_response) { json['data'] }
  let(:header_keys) { %w(importance content user-id) }

  describe "GET /headers" do
    it "sends a list of headers" do
      create_list(:header, 3)

      get "/headers"

      expect(response).to be_success
      expect(api_response.length).to eq(3)
    end
  end

  describe "GET /headers/:id" do
    it "retrieves a specific header" do
      header = create(:header)

      get "/headers/#{header.id}"

      expect(response).to be_success
      expect(api_response["attributes"]["importance"]).to eq(header.importance)
      expect(api_response["attributes"]["content"]).to eq(header.content)
      expect(api_response["attributes"].keys).to contain_exactly(*header_keys)
    end
  end
end
