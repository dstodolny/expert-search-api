require 'rails_helper'

describe Users::SelectQuery do
  let!(:user_1) { create(:user, name: "ABCD") }
  let!(:user_2) { create(:user, name: "EFGH") }
  let!(:user_3) { create(:user, name: "IJKL") }
  let!(:user_4) { create(:user, name: "MNOP") }
  let!(:user_5) { create(:user, name: "QRST") }

  let!(:friendship_1) { create(:friendship, user: user_1, friend: user_2) }
  let!(:firendship_2) { create(:friendship, user: user_3, friend: user_1) }

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
