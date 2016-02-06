require 'rails_helper'

describe User do
  subject { build(:user) }

  it { is_expected.to be_valid }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:url) }
  it { is_expected.to respond_to(:short_url) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:url) }

  it { is_expected.to allow_value("http://example.com").for(:url) }
  it { is_expected.not_to allow_value("example.com").for(:url) }
  it { is_expected.to allow_value("http://example.com").for(:short_url) }
  it { is_expected.not_to allow_value("example.com").for(:short_url) }

  it { is_expected.to have_many(:headers) }
  it { is_expected.to have_many(:friendships) }
  it do
    is_expected.to have_many(:direct_friends)
      .through(:friendships).source(:friend)
  end
  it do
    is_expected.to have_many(:inverse_friendships)
      .class_name("Friendship").with_foreign_key("friend_id")
  end
  it do
    is_expected.to have_many(:inverse_friends)
      .through(:inverse_friendships).source(:user)
  end

  describe "#friends" do
    let(:user_1) { create(:user) }
    let(:user_2) { create(:user) }
    let(:user_3) { create(:user) }

    it "return all friends of the user" do
      create(:friendship, user: user_1, friend: user_2)
      create(:friendship, user: user_3, friend: user_1)

      expect(user_1.friends).to contain_exactly(user_2, user_3)
    end
  end
end
