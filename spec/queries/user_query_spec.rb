require 'rails_helper'

describe UserQuery do
  let!(:user_1) { create(:user, name: "ABCD") }
  let!(:user_2) { create(:user, name: "EFGH") }
  let!(:user_3) { create(:user, name: "IJKL") }
  let!(:user_4) { create(:user, name: "MNOP") }
  let!(:user_5) { create(:user, name: "QRST") }

  let!(:friendship_1) do
    create(:friendship, user_id: user_1.id, friend_id: user_2.id)
  end

  let!(:firendship_2) do
    create(:friendship, user_id: user_3.id, friend_id: user_1.id)
  end

  subject { described_class.new(params).query }

  context "without a query param" do
    let(:params) { { user_id: user_1.id, q: '' } }

    it "responds with all non-friends of user" do
      expect(subject.count).to eq 2
      expect(subject).to contain_exactly(user_4, user_5)
    end
  end

  context "with a query param" do
    let(:params) { { user_id: user_1.id, q: "MN" } }

    it "responds with all non-friends of user that match the given query" do
      expect(subject.count).to eq 1
      expect(subject).to contain_exactly(user_4)
    end
  end
end
