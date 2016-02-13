require "rails_helper"

describe Users::PathQuery do
  let!(:user_1) { create(:user) }
  let!(:user_2) { create(:user) }
  let!(:user_3) { create(:user) }
  let!(:user_4) { create(:user) }
  let!(:user_5) { create(:user) }

  let!(:friendship_1) { create(:friendship, user: user_1, friend: user_4) }
  let!(:friendship_2) { create(:friendship, user: user_4, friend: user_3) }
  let!(:friendship_3) { create(:friendship, user: user_3, friend: user_2) }
  let!(:friendship_4) { create(:friendship, user: user_5, friend: user_1) }

  let!(:header_1) { create(:header, content: "Alpha Beta Gamma", user: user_2) }
  let!(:header_2) { create(:header, content: "Delta Epsilon Zeta", user: user_3) }
  let!(:header_3) { create(:header, content: "Eta Theta Iota", user: user_4) }
  let!(:header_4) { create(:header, content: "Omega", user: user_5) }

  subject { described_class.new(params).query }

  let(:params) { { user_id: user_1.id, q: "Beta" } }

  it "retrieves a collection of users in the right order" do
    expect(subject.count).to eq(4)
    expect(subject.first).to eq(user_1)
    expect(subject.second).to eq(user_4)
    expect(subject.third).to eq(user_3)
    expect(subject.fourth).to eq(user_2)
  end
end
