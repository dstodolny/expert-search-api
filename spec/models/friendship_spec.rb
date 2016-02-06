require 'rails_helper'

describe Friendship do
  subject { build(:friendship) }

  it { is_expected.to be_valid }

  it { is_expected.to respond_to(:user) }
  it { is_expected.to respond_to(:friend) }

  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:friend_id) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:friend) }
end
