require 'rails_helper'

describe User do
  subject { build(:user) }

  it { is_expected.to be_valid }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:url) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:url) }

  it { is_expected.to allow_value("http://example.com").for(:url) }
  it { is_expected.not_to allow_value("example.com").for(:url) }
end
